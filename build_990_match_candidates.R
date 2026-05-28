# =============================================================================
# build_990_match_candidates.R
#
# Builds a spreadsheet of candidate Form 990 matches for IPEDS institutions.
# One row per (institution, candidate) pair; manual review fills in `match`
# and `notes` columns.
#
# Outputs:
#   data/nccs/pz_eincount_cache.csv       (one-time PZ archive aggregation)
#   data/nccs/match_candidates.xlsx        (the spreadsheet for review)
#
# Usage:
#   Rscript code/transparency/build_990_match_candidates.R
# =============================================================================

library(tidyverse)
if (!requireNamespace("stringdist", quietly = TRUE))
  install.packages("stringdist", repos = "https://cran.r-project.org")
if (!requireNamespace("openxlsx", quietly = TRUE))
  install.packages("openxlsx", repos = "https://cran.r-project.org")
library(stringdist)
library(openxlsx)

# -----------------------------------------------------------------------------
# 1. Cache PZ EIN summary (n_files, n_unique_fy, latest contributions/assets)
# -----------------------------------------------------------------------------

pz_cache_path <- "data/nccs/pz_eincount_cache.csv"

if (!file.exists(pz_cache_path)) {
  cat("Building PZ EIN cache (one-time pass through 34 PZ files)...\n")
  pz_files <- list.files("data/nccs/pz", pattern = "\\.csv$", full.names = TRUE)

  ein_data <- map_dfr(pz_files, function(f) {
    cat(sprintf("  reading %s\n", basename(f)))
    df <- read_csv(f,
      col_select = c("F9_00_ORG_EIN", "F9_00_TAX_PERIOD_END_DATE",
                     "F9_08_REV_CONTR_TOT", "F9_10_ASSET_TOT_EOY"),
      col_types = cols(.default = col_character()),
      progress = FALSE)
    df$file_year <- str_extract(basename(f), "(?<=CORE-)\\d{4}")
    df
  }) %>%
    mutate(across(c(F9_08_REV_CONTR_TOT, F9_10_ASSET_TOT_EOY), as.numeric))

  cat("Aggregating per EIN...\n")
  ein_summary <- ein_data %>%
    group_by(F9_00_ORG_EIN) %>%
    summarise(
      n_files = n_distinct(file_year),
      n_unique_fy = n_distinct(F9_00_TAX_PERIOD_END_DATE),
      latest_fy = max(F9_00_TAX_PERIOD_END_DATE, na.rm = TRUE),
      .groups = "drop"
    )

  latest_vals <- ein_data %>%
    filter(!is.na(F9_00_TAX_PERIOD_END_DATE)) %>%
    arrange(F9_00_ORG_EIN, desc(F9_00_TAX_PERIOD_END_DATE)) %>%
    distinct(F9_00_ORG_EIN, .keep_all = TRUE) %>%
    select(F9_00_ORG_EIN,
           latest_contributions = F9_08_REV_CONTR_TOT,
           latest_assets        = F9_10_ASSET_TOT_EOY)

  ein_summary <- ein_summary %>%
    left_join(latest_vals, by = "F9_00_ORG_EIN") %>%
    rename(ein_raw = F9_00_ORG_EIN)

  write_csv(ein_summary, pz_cache_path)
  cat(sprintf("  Cached %d unique EINs to %s\n",
              nrow(ein_summary), pz_cache_path))
} else {
  cat(sprintf("Using existing PZ EIN cache at %s\n", pz_cache_path))
}

ein_cache <- read_csv(pz_cache_path, show_col_types = FALSE,
                      col_types = cols(ein_raw = col_character(),
                                       latest_fy = col_character()))

# -----------------------------------------------------------------------------
# 2. IPEDS institution summary
# -----------------------------------------------------------------------------

cat("Loading IPEDS panel...\n")
panel <- read_csv("data/cleaned/ipeds_panel.csv",
                  show_col_types = FALSE, progress = FALSE)

# Modal state per institution
inst_modal_state <- panel %>%
  count(unitid, state) %>%
  group_by(unitid) %>%
  slice_max(n, n = 1, with_ties = FALSE) %>%
  ungroup() %>%
  select(unitid, modal_state = state)

# Latest year metadata
ipeds_inst <- panel %>%
  arrange(unitid, desc(year)) %>%
  distinct(unitid, .keep_all = TRUE) %>%
  select(unitid, inst_name, sector, is_public, is_4year, is_2year)

# Mean endowment EOY
ipeds_endow <- panel %>%
  filter(!is.na(endowment_eoy), endowment_eoy > 0) %>%
  group_by(unitid) %>%
  summarise(mean_endow_eoy = mean(endowment_eoy, na.rm = TRUE),
            n_endow_years = n(),
            .groups = "drop")

ipeds_summary <- ipeds_inst %>%
  left_join(inst_modal_state, by = "unitid") %>%
  left_join(ipeds_endow, by = "unitid") %>%
  rename(state = modal_state)

cat(sprintf("  %d institutions in IPEDS panel\n", nrow(ipeds_summary)))

# -----------------------------------------------------------------------------
# 3. Candidate pool from BMF
#    Wide net: subsection_code == "3" AND
#      (nteev2_subsector in {EDU, UNI} OR ntee_code_major_group == "B")
# -----------------------------------------------------------------------------

cat("Loading BMF (filtered to education-related 501c3s)...\n")
bmf_path <- "data/nccs/bmf/bmf_2026_01_processed.csv"
bmf_keep <- c("ein", "ein_raw", "org_name_raw", "org_name_display",
              "org_addr_state", "org_addr_city",
              "subsection_code", "nteev2_subsector",
              "ntee_code_clean", "ntee_code_major_group",
              "filing_requirement_code_definition",
              "asset_amount")

bmf <- read_csv(bmf_path,
                col_select = all_of(bmf_keep),
                col_types = cols(.default = col_character(),
                                 asset_amount = col_double()),
                progress = FALSE)

bmf_cand <- bmf %>%
  filter(subsection_code == "3",
         (nteev2_subsector %in% c("EDU", "UNI") |
          ntee_code_major_group == "B")) %>%
  left_join(ein_cache, by = "ein_raw")

cat(sprintf("  %d BMF candidates after wide-net filter\n", nrow(bmf_cand)))

# -----------------------------------------------------------------------------
# 4. Match scoring
# -----------------------------------------------------------------------------

cat("Computing match candidates per institution...\n")

# Verified crosswalk from notes (May 2026): hand-coded (EIN, UNITID) pairs
# for the 31 confirmed public university foundations. Hand-coding avoids
# the brittleness of string-similarity-based auto-mapping (which fails
# for cases like "State University of Iowa Foundation" picking up
# "University of Northern Iowa" instead of "University of Iowa").
verified_pairs <- tribble(
  ~ein_raw,    ~unitid,
  "636022422", 100858L,   # Auburn University
  "942829914", 110699L,   # UC San Francisco
  "946090626", 110635L,   # UC Berkeley
  "846049811", 126614L,   # University of Colorado Boulder
  "586043294", 139755L,   # Georgia Institute of Technology
  "586033837", 139959L,   # University of Georgia
  "586033185", 139940L,   # Georgia State University
  "237034345", 140164L,   # Kennesaw State University
  "420796760", 153658L,   # University of Iowa
  "376006007", 145600L,   # University of Illinois Urbana-Champaign
  "351052049", 151102L,   # Purdue University-Main Campus
  "356018940", 151388L,   # Indiana University-Bloomington
  "356024566", 150136L,   # Ball State University
  "480547734", 155317L,   # University of Kansas
  "480667209", 155399L,   # Kansas State University
  "486121167", 156125L,   # Wichita State University
  "521125663", 163286L,   # University of Maryland-College Park
  "382138856", 172699L,   # Western Michigan University
  "382953297", 169798L,   # Eastern Michigan University
  "237326030", 171100L,   # Michigan State University
  "383555142", 172644L,   # Wayne State University
  "237318742", 186380L,   # Rutgers University-New Brunswick
  "310896555", 201885L,   # University of Cincinnati-Main Campus
  "311145986", 204796L,   # Ohio State University-Main Campus
  "936015767", 209551L,   # University of Oregon
  "626001104", 220473L,   # Johnson University (TN)
  "621844686", 221759L,   # University of Tennessee-Knoxville
  "742245072", 228714L,   # Texas A&M University-College Station
  "756043842", 229115L,   # Texas Tech University
  "540838566", 234076L,   # University of Virginia-Main Campus
  "390743975", 240444L    # University of Wisconsin-Madison
)
verified_eins <- verified_pairs$ein_raw

disqualifier_pattern <- str_c(
  "ALUMNI ASSOCIATION", "RESEARCH FOUNDATION", "MEDICAL FOUNDATION",
  "HEALTH SERVICES", "ATHLETIC", "LAW SCHOOL FOUNDATION",
  "PRESIDENT AND FELLOWS", "TRUSTEES OF",
  "BAND BOOSTER", "BOOSTER CLUB", "PARENT-TEACHER",
  sep = "|")

clean_name <- function(s) {
  s %>%
    coalesce("") %>%
    toupper() %>%
    str_remove_all("[^A-Z0-9 ]") %>%
    str_squish()
}

bmf_cand <- bmf_cand %>%
  mutate(cand_name_clean = clean_name(org_name_raw))

# Loop over institutions; vectorise within state
match_results <- vector("list", nrow(ipeds_summary))
n_inst <- nrow(ipeds_summary)
for (i in seq_len(n_inst)) {
  inst <- ipeds_summary[i, ]
  if (i %% 1000 == 0) cat(sprintf("  ...%d / %d\n", i, n_inst))

  if (is.na(inst$state)) next
  cands <- bmf_cand %>% filter(org_addr_state == inst$state)
  if (nrow(cands) == 0) next

  inst_clean <- clean_name(inst$inst_name)
  sim <- stringsim(inst_clean, cands$cand_name_clean,
                   method = "jw", p = 0.1)

  asset_ratio <- if (!is.na(inst$mean_endow_eoy) && inst$mean_endow_eoy > 0) {
    cands$asset_amount / inst$mean_endow_eoy
  } else {
    rep(NA_real_, nrow(cands))
  }
  # Asset score: Gaussian on log10 scale, peaked at ratio = 2.0
  # (typical foundation latest-assets vs. institution mean-endowment).
  # Lenient: scores > 0.7 across log10 ratio in [-0.3, 0.9], i.e.
  # asset_ratio in [0.5, 8].
  asset_score <- ifelse(!is.na(asset_ratio) & asset_ratio > 0,
                         exp(-(log10(asset_ratio) - 0.3)^2 / 0.5),
                         0)
  disqualifier <- str_extract(toupper(cands$org_name_raw), disqualifier_pattern)
  disqualifier_pen <- ifelse(is.na(disqualifier), 0, 0.15)
  file_prop <- coalesce(cands$n_files, 0L) / 34
  composite <- 0.6 * sim + 0.2 * asset_score + 0.1 * file_prop - disqualifier_pen

  cands$.sim <- sim
  cands$.asset_ratio <- asset_ratio
  cands$.disqualifier <- disqualifier
  cands$.file_prop <- file_prop
  cands$.composite <- composite

  # Drop candidates with very low similarity (< 0.5) UNLESS they are verified
  keep <- (cands$.sim >= 0.5) | (cands$ein_raw %in% verified_eins)
  cands <- cands[keep, ]
  if (nrow(cands) == 0) next

  top <- cands %>%
    arrange(desc(.composite)) %>%
    slice_head(n = 10) %>%
    mutate(cand_rank = row_number())

  # Force-include any verified EIN that's missing from top 10
  missing_verified <- cands %>%
    filter(ein_raw %in% verified_eins,
           !ein_raw %in% top$ein_raw)
  if (nrow(missing_verified) > 0) {
    missing_verified$cand_rank <- 99L  # appended at bottom; real rank lost
    top <- bind_rows(top, missing_verified)
  }

  top$inst_unitid     <- inst$unitid
  top$inst_name       <- inst$inst_name
  top$inst_state      <- inst$state
  top$inst_sector     <- inst$sector
  top$inst_is_public  <- inst$is_public
  top$inst_is_4year   <- inst$is_4year
  top$inst_is_2year   <- inst$is_2year
  top$inst_mean_endow <- inst$mean_endow_eoy

  match_results[[i]] <- top
}

cat("  Combining results...\n")
matches <- bind_rows(match_results)
cat(sprintf("  Total candidate rows: %d\n", nrow(matches)))

# -----------------------------------------------------------------------------
# 5. Format output
# -----------------------------------------------------------------------------

# Pre-populate match=Y only for the hand-coded verified pairs.
out <- matches %>%
  left_join(verified_pairs %>% mutate(.is_verified_pair = TRUE),
            by = c("ein_raw", "inst_unitid" = "unitid")) %>%
  mutate(
    .is_verified_pair = coalesce(.is_verified_pair, FALSE),
    match = ifelse(.is_verified_pair, "Y", ""),
    notes = ifelse(.is_verified_pair, "verified May 2026", "")
  ) %>%
  arrange(inst_state, desc(coalesce(inst_mean_endow, 0)), inst_unitid,
          cand_rank) %>%
  transmute(
    state              = inst_state,
    unitid             = inst_unitid,
    inst_name,
    sector             = inst_sector,
    is_public          = inst_is_public,
    is_4year           = inst_is_4year,
    is_2year           = inst_is_2year,
    mean_endow_M       = round(inst_mean_endow / 1e6, 1),
    cand_rank,
    cand_ein           = ein,
    cand_name          = org_name_display,
    cand_city          = org_addr_city,
    cand_subsector     = nteev2_subsector,
    cand_ntee          = ntee_code_clean,
    cand_assets_M      = round(asset_amount / 1e6, 1),
    cand_files         = n_files,
    cand_unique_fy     = n_unique_fy,
    cand_filing_req    = filing_requirement_code_definition,
    name_similarity    = round(.sim, 3),
    asset_ratio        = round(.asset_ratio, 2),
    disqualifier_flags = .disqualifier,
    composite_score    = round(.composite, 3),
    match,
    notes
  )

# -----------------------------------------------------------------------------
# 6. Write XLSX with header formatting and frozen panes
# -----------------------------------------------------------------------------

cat("Writing XLSX...\n")
out_path <- "data/nccs/match_candidates.xlsx"

wb <- createWorkbook()
addWorksheet(wb, "match_candidates")
writeData(wb, 1, out)

# Header bold + freeze top row + first column
addStyle(wb, 1, createStyle(textDecoration = "bold"),
         rows = 1, cols = seq_len(ncol(out)))
freezePane(wb, 1, firstRow = TRUE)
setColWidths(wb, 1, cols = seq_len(ncol(out)), widths = "auto")

saveWorkbook(wb, out_path, overwrite = TRUE)
cat(sprintf("  Output: %s (%d rows)\n", out_path, nrow(out)))
cat("Done!\n")



# Load required packages (pacman installs if missing)
pacman::p_load(
  tidyverse, broom, janitor, readr, stargazer, skimr,
  tidymodels, magrittr, doParallel, fixest, modelsummary,
  kableExtra, did, gt, beepr, ggplot2, maps,
  synthdid, devtools, augsynth
)


# Set working directory (local machine-specific)
setwd("C:/Working_Projects/HigherEdLabor")

# Load datasets
bmf_raw <- read.csv("../Research-Data-Storage/Data/NCCS/bmf_master_geocoded.csv") # BMF == Business Master File
# BMF does not appear to have time-series data 
# BMF is for matching data to other sources

match_candidates <- read.csv("../Research-Data-Storage/Data/NCCS/match_candidates.csv")

# Shrink BMF to workable size 
bmf <- bmf_raw %>% 
    select(
        org_name_raw,
        org_name_join,
        org_name_display,
        org_parent_name,
        dba_name,
        in_care_of_name_clean,
        org_addr_city,
        org_addr_state,
        org_addr_zip,
        exempt_organization_type,
        tax_period_ymd,
        asset_code_definition,
        asset_amount,
        income_amount,
        revenue_amount
    ) %>%
    filter(
        str_detect(org_name_raw, "UNIVERSITY|COLLEGE"), 
        asset_amount > 0
    )

# Load all the core 990s 
year_range = 1987:2011

core_combined <- data.frame() # All years combined, not matched by ein yet

for (year in year_range) {
    df <-  read.csv(paste0("../Research-Data-Storage/Data/NCCS/990 Combined Legacy/core_", year, "_990combined.csv")) # Load each year of data 

    df %<>% 
        select(
            ein, 
            total_contributions, # This should let us see effect on gifts and donations received
            gross_sales_securities,
            cost_basis_securities, 
            investment_income,
            total_revenue, 
            political_expenditures, 
            tax_period, 
            gross_receipts_related_activities_sec170, 
            source_subsection_class
        ) %>% 
        mutate( 
            year = year
        )

    core_combined <- bind_rows(core_combined, df)
}

write.csv(core_combined, file = "../Research-Data-Storage/Data/NCCS/Core_Combined_990_All_Years.csv")
# Reload data so that you don't have to run this every time
core_combined <- read.csv("../Research-Data-Storage/Data/NCCS/Core_Combined_990_All_Years.csv")

# match by ein using match_candidates
mdf <- match_candidates %>% 
    filter(cand_rank == 1, composite_score > 0.6, name_similarity > 0.8) %>% 
    rename(ein = "cand_ein") %>%
    left_join(core_combined %>% filter(year==2000), by = c("ein" = "ein"), relationship = "many-to-many")

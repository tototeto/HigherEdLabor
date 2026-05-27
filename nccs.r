

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

# n : Nonprofit
# c : Charity 
# pz : 990 and 990 EZ 
pzn2023 <- read.csv("../Research-Data-Storage/Data/NCCS/pz_nonprofit_2023.csv")
pzc2023 <- read.csv("../Research-Data-Storage/Data/NCCS/pz_charity_2023.csv")
# All this data seems overwhelmingly missing 

core2011 <- read.csv("../Research-Data-Storage/Data/NCCS/core_2011_990combined.csv")

match_candidates <- read.csv("../Research-Data-Storage/Data/match_candidates.csv")

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

irs990_2024 %<>%
    filter(
        str_detect(ORG_NAME_L1, "UNIVERSITY|COLLEGE")
    )

# Shrink PZs to workable size 
all_pzs = list(pzn2023)

# I guess we don't need names or locations, only EINs because we will get that through matching on EINs to other data
for (i in seq_along(all_pzs)) {
    all_pzs[[i]] %<>% 
        select(
            ein2 = EIN2, 
            ein = F9_00_ORG_EIN,
            school = F9_04_SCHOOL_X, 
            investment_income = F9_08_REV_OTH_INVEST_INCOME_TOT,
            securities_amt = F9_08_REV_OTH_SALE_LESS_COST_SEC, 
            cash = F9_10_ASSET_CASH_EOY,
            total_assets_eoy = F9_10_ASSET_TOT_EOY,
            support_amt = SA_01_PCSTAT_ORG_AMT_SUPPORT
        )
}

view(all_pzs[[1]])

view(pzc2023 %>%
    select(
            EIN2, 
             F9_00_ORG_EIN,
            F9_04_SCHOOL_X, 
            F9_08_REV_OTH_INVEST_INCOME_TOT,
            F9_08_REV_OTH_SALE_LESS_COST_SEC, 
            F9_10_ASSET_CASH_EOY,
            F9_10_ASSET_TOT_EOY,
            SA_01_PCSTAT_ORG_AMT_SUPPORT
        ))

# PZs aren't working, try Core 990 Combined
core_test <- core2011 %>% 
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
    )

match_top <- match_candidates %>% 
    filter(cand_rank == 1) %>% 
    rename(ein = cand_ein)

core_combined <- match_top %>% 
    left_join(core_test, by = "ein", relationship = "many-to-many")

# Do this for all the core 990s 
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

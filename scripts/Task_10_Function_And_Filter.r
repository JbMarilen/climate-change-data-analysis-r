# Task 10: Function and Filter

source("scripts/Task_1.1_Setup.R")

Lowest_ClimateRI <- function(x) {
    climate %>%
        group_by(country) %>%
        summarize(average_climateRI = mean(climate_risk_index)) %>%
        slice_min(average_climateRI, n = 2)
}

Lowest_ClimateRI(climate)
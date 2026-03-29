# Task 10: Function and Filter

source("scripts/Task_1.1_Setup.R") # load df and dplyr

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

# question : Creates a function that evaluates all countries based on their average climate_risk_index, 
# and then returns the 2 countries with the lowest climate_risk_index.
Lowest_ClimateRI <- function(x) {
    climate %>%
        # the rows in the climate df get grouped by unique country names
        group_by(country) %>%
        # this calculates the average climate risk index for each county
        summarize(average_climateRI = mean(climate_risk_index)) %>%
        # this finds the the lowest 2 country with the smallest climate risk index
        slice_min(average_climateRI, n = 2)
}

# this returns the 2 countries with the lowest climate_risk_index.
Lowest_ClimateRI(climate)
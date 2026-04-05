# Task 10: Function and Filter

source("scripts/Task_1.1_Setup.R") # load df and dplyr

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

# question: Creates a function that evaluates all countries based on their average
# climate_risk_index, and returns the 2 countries with the lowest climate_risk_index.
Lowest_ClimateRI <- function(df) {
    df %>%
        # the rows in the df get grouped by unique country names
        group_by(country) %>%
        # this calculates the average climate risk index for each country
        summarize(average_climateRI = mean(climate_risk_index)) %>%
        # slice_min() returns the n rows with the smallest value - cleaner than arrange() + head()
        slice_min(average_climateRI, n = 2)
}

# Test with dummy data before running on the real dataset
# Expected: "Brazil" and "Canada" should be returned as the lowest two
test_df <- data.frame(
    country = c("Brazil", "Brazil", "Canada", "Canada", "USA", "USA"),
    climate_risk_index = c(10, 12, 15, 17, 30, 32)
)
print("Test result (expected: Brazil and Canada):")
print(Lowest_ClimateRI(test_df))

# Apply the function to the real climate dataset
print("Lowest Climate Risk Index countries (real data):")
print(Lowest_ClimateRI(climate))

# Cross-check: the 2 countries returned here should match the 2 leftmost bars
# in the Task 6 bar chart, since both rank by average_climateRI ascending
# Cross-check = TRUE
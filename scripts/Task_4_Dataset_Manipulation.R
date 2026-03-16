# Task 4: Dataset Manipulation - Grouping, Summarising, and Merging

source("scripts/Task_1.1_Setup.R") # load df and dplyr

# For each unique country, calculate the expected average temperature in 2050
calculate_expected_temp_2050 <- function(df) {
    df %>% # take the input dataframe
        group_by(country) %>% # split data into groups, one per unique country
        summarise( # collapse each group down to a single summary row
            # expected_avg_temperature_2050 is calculated as the mean of global_avg_temperature plus the mean of predicted_temperature_2050 for that country
            expected_avg_temperature_2050_country = mean(global_avg_temperature) + mean(predicted_temperature_2050)
        ) %>%
        as.data.frame() # convert the tibble to a dataframe
}

# Apply the function to the climate dataset
# The result is a 2-column dataframe with "country" and "expected_avg_temperature_2050_country"
country_expected_avg_temperatures_2050 <- calculate_expected_temp_2050(climate)

# Print result to confirm the function produced the expected output
print(country_expected_avg_temperatures_2050)

# write.csv() exports the dataframe as a .csv file
# row.names = FALSE prevents R from adding an unwanted index column
write.csv(country_expected_avg_temperatures_2050, 
    "data/country_expected_avg_temperatures_2050.csv",
    row.names = FALSE)

# merge() performs a join between the original climate and the new summary table
# by = "country" tells R to match rows using the "country" column as the key
# The result is a new dataframe that contains all original columns from climate plus the new expected_avg_temperature_2050_country column from the summary table, aligned by country
merged_temperatures <- merge(
    climate,
    country_expected_avg_temperatures_2050,
    by = "country"
    )

# Save the merged dataframe to a .csv file
write.csv(
    merged_temperatures,
    "data/merged_temperatures.csv",
    row.names = FALSE
)

# Preview first 6 rows to confirm the merge was successful
print(head(merged_temperatures))

# Task 3: Function and Data Manipulation

source("scripts/Task_1.1_Setup.R") # load df and dplyr

# question : "Choose the columns 'max_temperature', 'min_temperature', ‘sea_surface_temperature’ and 'global_avg_temperature'"
# this selects the listed columns and makes a new df with them using thier data, 
# essentially its rows stay the same but its only got the columns we want it to have
Temp_Data <- climate %>%
    select(max_temperature, min_temperature, sea_surface_temperature, global_avg_temperature)

# question : "Write a function that performs the following tasks"
# this function essentially gets the data in one column and subtracts it from another one to make a new data set, we used df[[]] insted of df$ because $ dosnt work for string variables
Temp_Diff <- function(df, col_a, col_b) {
    df[[col_a]] - df[[col_b]]
}

# Test the function works before using it in the pipeline
# Expected: a numeric vector of differences between max and min temperature
test_result <- Temp_Diff(Temp_Data, "max_temperature", "min_temperature")
print(head(test_result))

# mutate() adds new columns to the dataframe without removing existing ones
# The dot (.) refers to the dataframe currently being piped, in this case Temp_Data
# This means we're correctly passing the piped data into Temp_Diff rather than hardcoding Temp_Data inside the function call, which would break if we ever piped a different dataframe through
climate_temperature_differences <- Temp_Data %>%
    mutate(
        temperature_diff = Temp_Diff(., "max_temperature", "min_temperature"),
        seasurface_air_temp_diff = Temp_Diff(., "sea_surface_temperature", "global_avg_temperature")
    )

# Preview to confirm the two new columns were added correctly
print(head(climate_temperature_differences))

# this saves the climate_temperature_diffreneces df as a r binary data file 
saveRDS(climate_temperature_differences, file = "data/climate_temperature_differences.rds")
print("data/climate_temperature_differences.rds")

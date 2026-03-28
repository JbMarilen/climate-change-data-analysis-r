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

# this uses the function "temp_diff" that we made to do what the question asks and adds them into a new df called "climate_temperature_diffrences" giving us 2 new columns 
climate_temperature_differences <- Temp_Data %>%
    mutate(
        temperature_diff = Temp_Diff(Temp_Data, "max_temperature", "min_temperature"),
        seasurface_air_temp_diff = Temp_Diff(Temp_Data, "sea_surface_temperature", "global_avg_temperature")
        )

# this saves the climate_temperature_diffreneces df as a r binary data file 
saveRDS(climate_temperature_differences, file = "data/climate_temperature_differences.rds")
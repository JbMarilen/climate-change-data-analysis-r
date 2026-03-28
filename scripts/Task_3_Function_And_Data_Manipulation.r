# Task 3: Function and Data Manipulation

source("scripts/Task_1.1_Setup.R") # load df and dplyr

Temp_Data <- climate %>%
    select(max_temperature, min_temperature, sea_surface_temperature, global_avg_temperature)

Temp_Diff <- function(df, col_a, col_b) {
    df[[col_a]] - df[[col_b]]
}

climate_temperature_differences <- Temp_Data %>%
    mutate(
        temperature_diff = Temp_Diff(Temp_Data, "max_temperature", "min_temperature"),
        seasurface_air_temp_diff = Temp_Diff(Temp_Data, "sea_surface_temperature", "global_avg_temperature")
        )

saveRDS(climate_temperature_differences, file = "data/climate_temperature_differences.rds")
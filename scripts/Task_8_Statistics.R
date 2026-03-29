
source("scripts/Task_1.1_Setup.R") #load df and dplyr

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

statistic_func <- function(df) {
    return(list(
        m = mean(df),
        v = var(df),
        std = sd(df)
    ))
}

#finding the statistics of the expected average temperature 2050 dataframe
df_temp_50 <- read.csv("data/country_expected_avg_temperatures_2050.csv")
stats_2050 <- statistic_func(df_temp_50$expected_avg_temperature_2050_country)

print("Predicted Average Temperature 2050")
print(stats_2050$m)

uk_temps_df <- climate %>%
  filter(country == "UK") %>%
  select(max_temperature)

uk_temps <- uk_temps_df$max_temperature

stats_uk <- statistic_func(uk_temps)
print("Standard Deviation of UK max temperatures")
print(stats_uk$std)
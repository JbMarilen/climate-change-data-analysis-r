source("scripts/Task_1.1_Setup.R") #load df and dplyr

statistic_func <- function(col) {
    return(list(
        mean = mean(col),
        variance = var(col),
        standard_deviation = sd(col)
    ))
}

#finding the statistics of the expected average temperature 2050 dataframe
temp_2050_data <- read.csv("data/country_expected_avg_temperatures_2050.csv")
stats_2050 <- statistic_func(temp_2050_data$expected_avg_temperature_2050_country)

print("Predicted Average Temperature 2050")
print(stats_2050$mean)

uk_temps_df <- climate %>%
  filter(country == "UK") %>%
  select(max_temperature)

uk_temps <- uk_temps_df$max_temperature

stats_uk <- statistic_func(uk_temps)
print("Standard Deviation of UK max temperatures")
print(stats_uk$standard_deviation)
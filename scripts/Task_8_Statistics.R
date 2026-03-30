
source("scripts/Task_1.1_Setup.R") #load df and dplyr

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

# question: Write a function that accepts a range of values and then calculates the mean, variance and standard deviation of the values.
statistic_func <- function(df) {
    # this function returns a list with the mean, variance, and sd of the values inputted.
    return(list(
        m = mean(df),
        v = var(df),
        std = sd(df)
    ))
}

# finding the statistics of the expected average temperature 2050 dataframe
df_temp_50 <- read.csv("data/country_expected_avg_temperatures_2050.csv")
stats_2050 <- statistic_func(df_temp_50$expected_avg_temperature_2050_country)

# printing just the mean of the average temp in 2050, as the question asked
print("Predicted Average Temperature 2050")
print(stats_2050$m)

# selecting just the max_temperature column from UK entries
uk_temps_df <- climate %>%
  filter(country == "UK") %>%
  select(max_temperature)

# taking in just the max_temp column
uk_temps <- uk_temps_df$max_temperature
stats_uk <- statistic_func(uk_temps)

# finding and printing just the sd of the max temperatures
print("Standard Deviation of UK max temperatures")
print(stats_uk$std)
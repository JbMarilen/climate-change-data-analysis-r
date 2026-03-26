
source("scripts/Task_1.1_Setup.R") #load df and dplyr
source("scripts/Task_4_Dataset_Manipulation")

statistic_func <- function(df) {
    stats_full <- list(
        m = mean(df),
        v = var(df),
        std = sd(df)
    )
}

#finding the statistics of the expected average temperature 2050 dataframe
stats_2050 <- statistic_func(country_expected_avg_temperatures_2050.csv)
print(stats_2050)
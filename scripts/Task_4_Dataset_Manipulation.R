library(dplyr)
source("scripts/Task_1.1_Setup.R")

country_expected_avg_temperatures_2050 <- climate %>%
    group_by(country) %>%
    summarise(
        expected_avg_temperature_2050_country = mean(global_avg_temperature) + mean(predicted_temperature_2050)
    ) %>%
    as.data.frame()

print(country_expected_avg_temperatures_2050)

write.csv(country_expected_avg_temperatures_2050, 
    "outputs/country_expected_avg_temperatures_2050.csv",
    row.names = FALSE)

merged_temperatues <- merge(
    climate,
    country_expected_avg_temperatures_2050,
    by = "country"
    )

write.csv(
    merged_temperatues,
    "outputs/merged_temperatures.csv",
    row.names = FALSE
)

print(head(merged_temperatues))

#Task 7: Scatterplot
source("scripts/Task_1.1_Setup.R") # load df, dplyr, ggplot2

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

aggregated_data <- climate %>%
    group_by(year) %>%
    summarize(co2_concentration_mean = mean(co2_concentration_ppm), temperature_mean = mean(temperature_anomaly))


#print(aggregated_data, n = 20)
scatter_plot <- ggplot(aggregated_data, aes(x = co2_concentration_mean, y = temperature_mean)) +
    geom_point() +
    geom_smooth(method = "lm", se = TRUE, color = "blue") +  # adds regression line
    labs (
        title = "CO2 Concentration (ppm) vs Average Temperature Anomaly",
        x = "Average CO2 Concentration (ppm)",
        y = "Average Temperature Anomaly"
    )

print(scatter_plot)
ggsave("charts/Task_7_Scatter_plot.png", plot = scatter_plot)
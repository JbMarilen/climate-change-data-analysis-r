source("scripts/Task_1.1_Setup.R") # load df, dplyr, ggplot2

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

only_uk <- climate %>%
  # The rows of the country df get filtered by the country UK
  filter(country == "UK")

# The first 100 rows of the new df are kept and retained. 
if (nrow(only_uk) > 100) {
  first_100_uk <- only_uk[1:100,]
}

# This forms a scatter plot with the 100 rows, with co2 concentration over time
scatter_uk <- ggplot(first_100_uk, aes(x = year, y = co2_concentration_ppm)) +
  geom_point(color = "steelblue", size = 2) +
  labs(
    title = "Co2 concentration in the UK over time",
    x = "Time (in years)",
    y = "Co2 Concentration (ppm)"
  ) +
  theme_minimal()

#Prints and saves the scatter plot as a png
print(scatter_uk)
ggsave("charts/Task_9_Co2_UK_100.png", plot = scatter_uk)
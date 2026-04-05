source("scripts/Task_1.1_Setup.R") #load df and dplyr

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

#the histogram is split in 2, this graph creates seperate ones for each country
histogram_sea_facet <- ggplot(climate, aes(x = sea_level_rise_mm, fill = country)) +
  geom_histogram(binwidth = 0.5, color = "black") +
  labs(
    title = "Distribution of Sea Level Rise (mm)",
    x = "Sea Level Rise (mm)",
    y = "Frequency"
  ) +
  facet_wrap(~country) +
  theme_minimal() +
  theme(legend.position = "none") # removes the legend since each facet is already labelled with the country name

#histogram for all countries, different colours for each country
histogram_sea_all <- ggplot(climate, aes(x = sea_level_rise_mm, fill = country)) +
  geom_histogram(binwidth = 0.5, color = "black") +
  labs(
    title = "Distribution of Sea Level Rise (mm)",
    x = "Sea Level Rise (mm)",
    y = "Frequency"
  ) +
  theme_minimal()

# prints and saves both graphs as pngs
print(histogram_sea_all)
ggsave("charts/Task_5_Histogram_sea_all.png", plot = histogram_sea_all)

print(histogram_sea_facet)
ggsave("charts/Task_5_Histogram_sea_countries.png", plot = histogram_sea_facet)
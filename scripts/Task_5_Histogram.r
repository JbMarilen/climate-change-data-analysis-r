source("scripts/Task_1.1_Setup.R") #load df and dplyr

#the histogram is split in 2, this graph creates seperate ones for each country
histogram_sea_facet <- ggplot(climate, aes(x = sea_level_rise_mm, fill = country)) +
  geom_histogram(binwidth = 0.5, color = "black") +
  labs(
    title = "Distribution of Sea Level Rise (mm)",
    x = "Sea Level Rise (mm)",
    y = "Frequency"
  ) +
  facet_wrap(~country)

histogram_sea_all <- ggplot(climate, aes(x = sea_level_rise_mm, fill = country)) +
  geom_histogram(binwidth = 0.5, color = "black") +
  labs(
    title = "Distribution of Sea Level Rise (mm)",
    x = "Sea Level Rise (mm)",
    y = "Frequency"
  )

print(histogram_sea_all)
ggsave("charts/Task_5_Histogram_sea_all.png", plot = histogram_sea_all)

print(histogram_sea_facet)
ggsave("charts/Task_5_Histogram_sea_countries.png", plot = histogram_sea_facet)
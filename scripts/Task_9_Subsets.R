source("scripts/Task_1.1_Setup.R") #load df and dplyr

only_uk <- climate %>%
  filter(country == "UK")

first_100_uk <- only_uk[1:100,]

scatter_uk_100 <- ggplot(first_100_uk, aes(x = year, y = co2_concentration_ppm)) +
  geom_point()

print(scatter_uk_100)
ggsave("charts/Task_9_Subsets.png", plot = scatter_plot)
# Task 6: Bar Chart
source("scripts/Task_1.1_Setup.R")

climateRI_summary <- climate %>%
    group_by(country) %>%
    summarize(average_climateRI = mean(climate_risk_index)) %>%
    arrange(average_climateRI) %>%

Bar_Plot <- ggplot(climateRI_summary, aes(x = reorder(country, average_climateRI), y = average_climateRI)) + geom_col() + labs(title = "Average Climate Risk Index per Country", x = "Country", y = "Average Climate Risk Index")


# Task 6: Bar Chart
source("scripts/Task_1.1_Setup.R") # load df, dplyr, ggplot2

# this loads the saved R binary data from task 3
climate_temperature_differences <- readRDS("data/climate_temperature_differences.rds")

# Grouped the data by country to compute the mean climate_risk_index
climateRI_summary <- climate %>%
    # the rows get grouped by unique country names
    group_by(country) %>%
    # this calculates the average of the climate_risk_index for each country
    summarize(average_climateRI = mean(climate_risk_index)) %>%
    # sorts the data table by the mean value in assending order
    arrange(average_climateRI)

# creates the bar chart
Bar_Chart <- ggplot(climateRI_summary, aes(
    # "reorder" ensures that the countries that appear on the x-axis are in assending order of thier corresponding mean values of climate_risk_index
    x = reorder(country, average_climateRI), 
    y = average_climateRI,
    fill = country
)) + 
    # draws the type of chart in our case bar chart
    geom_col() + 
    # add a title and names the x and y axis
    labs(
        title = "Average Climate Risk Index per Country", 
        x = "Country", 
        y = "Average Climate Risk Index"
        )

print(Bar_Chart)
ggsave("charts/Task_6_Bar_Chart.png", plot = Bar_Chart)

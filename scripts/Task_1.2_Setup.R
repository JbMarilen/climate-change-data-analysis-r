# Task 1.2: Test ggplot2 installation and verify it works

source("scripts/Task_1.1_Setup.R") # load ggplot2 and df

# Task specifically asks to use max_temperature (x) and co2_concentration_ppm (y) to test ggplot2
print(
    ggplot(climate, aes(x = max_temperature, y = co2_concentration_ppm)) +
    geom_point() +
    labs(
        title = "Test Plot: Max Temperature vs CO2 Concentration",
        x = "Max Temperature (°C)",
        y = "CO2 Concentration (ppm)"
    )
)
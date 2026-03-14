# Task 1.2: Test ggplot2 installation and verify it works

source("scripts/Task_1.1_Setup.R") # load ggplot2 and df

#

print(
    ggplot(climate, aes(x = max_temperature, y = co2_concentration_ppm)) +
    geom_point() +
    labs(
        x = "Max Temperature (°C)",
        y = "CO₂ Concentration (ppm)"
    )
)
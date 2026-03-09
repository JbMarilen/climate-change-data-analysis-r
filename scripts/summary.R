# Load the climate change dataset
climate_data <- read.csv("data/Beginner_Climate_Change_Dataset_20_Features_1200_Rows.csv")

# Calculate frequency count of each unique country
freq_count <- table(climate_data$country)

# Display the frequency count
print(freq_count)

# Task 2: Summary Statistics - Frequency Count & Proportions

source("scripts/Task_1.1_Setup.R") # load df

# Question 1: Frequency count of each unique country
# table() scans the 'country' column and counts how many times each unique country name appears in the dataset
# The result is a named vector where each name is a country and each value is its count (e.g., UK = 95)
freq_count <- table(climate$country)

# Display the frequency count
print(freq_count)

# Question 2: Proportions of each country in the dataset
# Divide each country's frequency count by the total number of rows in the dataset (nrow)
# nrow(climate) returns the total number of observations (1200)
# R applies the division to every element automatically (vectorised)
# The result is a value between 0 and 1 for each country, representing its share of the full dataset
country_proportions <- freq_count / nrow(climate)

# Print the proportions
print(country_proportions)

# Optional: convert to a dataframe if required
# proportions_df <- as.data.frame(country_proportions)
# colnames(proportions_df) <- c("country", "country_proportions")
# print(proportions_df)

# WEIRD WORDING OF QUESTION REMEMBER TO CHECK IF THIS IS WHAT THEY WANT
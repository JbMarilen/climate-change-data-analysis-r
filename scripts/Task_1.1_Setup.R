# Task 1.1: Install and load ggplot2, and load the climate change dataset

# Install ggplot2 if it's not already installed
if (!require(ggplot2)) {
  install.packages("ggplot2")
}

# Load the ggplot2 library
library(ggplot2)

# Load the climate change dataset
climate <- read.csv("data/Beginner_Climate_Change_Dataset_20_Features_1200_Rows.csv")
# Task 1.1: Install and load ggplot2 (through tidyverse, allowing for dplyr and ggplot2), and load the climate change dataset

# Install tidyverse if it's not already installed
if (!require(tidyverse)) {
  install.packages("tidyverse")
}

# Load the tidyverse library
library(tidyverse)

# Load the climate change dataset
climate <- read.csv("data/Beginner_Climate_Change_Dataset_20_Features_1200_Rows.csv")
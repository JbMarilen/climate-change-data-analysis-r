# CSC1013 Project 1 — Report
## Climate Change & Global Warming Data Analysis

**Group:** sapply(data, pls_clean_me)  


---

## 1. Introduction
Brief overview of the project goal, the dataset (1200 rows, 20 features), 
and what the group set out to explore.

---

## 2. Task Documentation

### Task 1 — Setup & Installation

#### Task 1.1 — Install & Load ggplot2, Read Dataset

**What was done:**  
- Used a conditional `if (!require(ggplot2))` check before installing. This prevents
  re-installing the package every time the script runs.
- Loaded the library with `library(ggplot2)`.
- Loaded the dataset using `read.csv()` with a relative path (`data/...`), making the
  script portable across team members' machines as long as the working directory is set
  to the project root.
- The dataset was stored in a variable named `climate`.

**Key decisions:**
- Relative path chosen over absolute path so any team member can run the script without
  changing file paths.
- `if (!require(...))` pattern used instead of a plain `install.packages()` call.

#### Task 1.2 — Test ggplot2 Installation

**What was done:**  
- Produced a basic scatterplot using `ggplot()` with `aes(x = max_temperature,
  y = co2_concentration_ppm)` and `geom_point()` as required by the task spec.
- Added axis labels using `labs()` including the degree symbol (°C) and subscript
  formatting for CO₂ (ppm) for clarity.

**Key decisions:**  
- Labels added beyond the bare minimum to demonstrate attention to chart quality.
  
### Task 2 — Frequency Counts & Proportions

**What was done:**

**Question 1 — Frequency Count:**  
- Used `table(climate$country)` to count occurrences of each unique country in the
  `country` column.
- `table()` is a base R function that returns a named vector (each name is a unique
  country, each value is its count).
- Result saved as `freq_count` as required by the task specification.

**Question 2 — Proportions:**  
- Calculated proportions by dividing `freq_count` by `nrow(climate)`, which returns
  the total number of rows (1200).
- R performs this division vectorised, meaning it automatically divides every element
  of `freq_count` by 1200 without needing a loop.
- Each resulting value is between 0 and 1, representing that country's share of the
  full dataset.
- Result saved as `country_proportions`.

**Key decisions:**  
- `nrow(climate)` used instead of hardcoding `1200`. This makes the calculation
  correct even if the dataset size ever changes.
- An optional conversion to a named dataframe is included (commented out) in case the
  task requires a tidy two-column format (`country`, `country_proportions`). This was
  left commented pending clarification of the task wording.

### Task 3 — Temperature Difference Function

**What was done:**

**Data - 4 columns, (max_temperature, min_temperature, sea_surface_temperature and global_avg_temperature) were chosen from the climate dataframe and stored as Temp_Data using the select() function

**Dynamic Function- made a function that got the diffrence between 2 columns, it accepts the column name as strings and gives a numeric vector output which is the differences of the 2 names columns.
we used df[[col_a]] instead of df$col_a as the question said to make the function dynamic and $ does not work with string variables, i.e. this makes the function usable with any column names that are given as the arguments.

**Outside the function:**
tested the function on temp_data before using it in the pipeine to ensure it gave the correct output

used mutate() to add new columns (Temperature_diff and seasurface_air_temp_diff) like the question asked and used the function we made to get their values 

we used "." instead of Temp_data in the function as to keep it dynamic as oppose to hardcoding it

made a new dataframe (climate_temperature_differences) using the data from temp_diff dataframe and saved it as a R Binary file using saveRDS()

**Key Decisions:**
used df[[]] instead of df$ to ensure the function stays dynamic and to allow column names to be passed as strings 

used "." instead of "temp_data" to make the function work on any dataframe and not just Temp_data

we tested the temp_data df before using mutate() to add new columns to ensure the function was working as it was intended to


### Task 4 — Expected 2050 Temperature & Merge

**What was done:**

**Function — `calculate_expected_temp_2050()`:**
- Accepts any dataframe as input and returns a two-column summary dataframe
  containing each unique country and its expected average temperature in 2050.
- `group_by(country)` splits the data into one group per unique country.
- `summarise()` collapses each group into a single row using the formula from the task spec:
  - `expected_avg_temperature_2050_country = mean(global_avg_temperature) + mean(predicted_temperature_2050)`
- `as.data.frame()` converts the tidyverse tibble output into a standard R dataframe.

**Outside the function:**
- The function was applied to the `climate` dataframe and the result stored as
  `country_expected_avg_temperatures_2050`.
- Exported to `country_expected_avg_temperatures_2050.csv` using `write.csv()`.
- Merged back into the original `climate` dataframe using `merge()`, joining on the
  `country` column. This adds `expected_avg_temperature_2050_country` to every row,
  matched by country.
- Final merged dataframe saved as `merged_temperatures.csv`.

**Key decisions:**
- The function takes `df` as a parameter rather than referencing `climate` directly,
  keeping it dynamic and reusable. The task spec explicitly requires the function to
  work with any dataframe, not just `climate`. That said, for a calculation this simple
  a function is not strictly necessary and could have been done in a single pipe chain.
- `row.names = FALSE` used in both `write.csv()` calls to prevent R writing an
  unwanted numeric index column into the output files.
- Two verification prints are included — one after the function call, one after the
  merge — to confirm each step produced the correct output.

### Task 5 — Histogram

**What was done:**

**Question:**
- Make a histogram of `sea_level_rise_mm` column.
- This was done using ggplot, using different country colors to easily distinguish 
between countries, labeled the axises accordingly and changed the binwidth.
- Decided to add another graph faceted by countries, so each country has their own mini
graph to analyse.
- Saved the graphs as pngs using ggsave and put them into the graphs.

### Task 6 — Bar Chart

**What was done:**

**Data - "ClimateRI_summary":**
we grouped by the country column on the climate data frame and using Summarize() we computed the mean of the climate_risk_index column for each country and stored the output into "average_climateRI"
used arrange() to sort the values of average_climateRI into ascending order

**The Bar Chart - "Bar_chart":**
used ggplot() with climateRI_summary as the data
reorder() was used on the x axis to ensure that the data is shown in ascending order of their y values, i.e. it makes it so the x values with the lowest y value appear on the left and the highest on the right
fill = ... makes each x value appear distinct to make the graph easier to understand
labs() lets you add titles and names to x and y axes

**Key Decisions:**
reorder() was used in addition to arrange() as ggplot does not always respect the order of the dataframe so we used reorder to ensure that it does what the question asked us to do

geom_col() was used instead of geom_bar() as we already computed mean values and so there was no need for ggplot to aggregate anything 


### Task 7 — Scatterplot

**What was done:**

**Question 1: Aggregating Data**
- grouped the dataframe by the year (`groupby`) and used `summarize` to get the mean 
`co2_concentration_ppm` and `temperature_anomaly` for each year.

**Question 2: Creating Scatterplot**
- used ggplot to create a scatterplot with the required X and Y axis using the
data from question 1s aggregated data.
- also created a line of linear regression `geom_smooth` to see if there was a 
pattern in the graph.
- the linear regression line showed a very subtle trend of mean temperature
increasing as the mean co2 in the atmosphere increased. 
- The graph was saved as a png using ggsave

### Task 8 — Statistical Functions

**What was done:**

**Question 1: Creating the Function**
- The function in this question accepts a range of values (in a list)
returns a list of 3 different outputs, mean, standard deviation and variance
- This was using R built in functions (`mean(), sd(), var()`)

**Question 2: Using the Function**
- We read the 2050 temperature CSV in and put it into the function with just 
the expected average temperature using the (`$`) symbol to choose a single row
- Printed just the mean using the same method `print(stats_2050$m)`

- For the next part, we filter the main dataframe to only include the columns of UK and 
the respective Max Temperature of the UK entries.
- We then ran the Max Temperature column into the function, only outputting the 
standard deviation with `$std`

### Task 9 — Filter & Plot (UK)

**What was done:**

**Question 1: Filtering Data**
- Firstly, filtered the climate data frame to only show UK entries, 
this keeps all the rows, and the question needs 100 rows. This was 
done using `only_uk[1:100,]` to only select the rows 1 to 100.
This allows us to properly plot only the first 100 rows of the dataframe

**Question 2: Plotting the Data**
- Using the 100 row dataframe we got from Question 1, we make a scatterplot 
for co2 concentration over time (years). The graph shows that there has been 
a rise in base co2 levels over the years as more of the dots are upper leaning
- The graph was done using ggplot and labeled accordingly. It is also saved 
using ggsave as a png.

### Task 10 — Lowest Climate Risk Function

**What was done:**

**Function- Lowest_ClimateRI():**
splits the dataframe into one group per unique country using group_by(country) and compute the mean climate_risk_index using summarize() and stores it into average_climateRI, we return the 2 rows with the lowest average_climateRI using slice_min(average_climateRI, n = 2)

we then use the function "Lowest_ClimateRI" on the climate dataframe to see if it outputs the countries with the lowest average_climateRI
another way to see that this function works is by looking at our bar_chart and see the first 2 x values if they match with our output of "Lowest_ClimateRI(climate)" then we know that the function works

**Key decisions:**
used slice_min() as oppose to arrange() and head() as it makes the code easier to understand and does not overcomplicate it and it returns the n smallest values without needing to sort the entire data frame first

## References
- Lander, J.P. (2014). *R for Everyone*. Ch. 6–7
- Wickham, H. *ggplot2 documentation*. https://ggplot2.tidyverse.org/
- DCU CSC1013 Lecture slides
- Dataset: Kaggle — Beginner Climate Change Dataset

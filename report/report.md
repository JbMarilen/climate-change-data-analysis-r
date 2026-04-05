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
...

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
...

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
...

---

## 3. Challenges & Decisions
What was difficult, what choices you made and why.

---

## 4. AI Usage Log

| Task | Prompt Summary | Initial Output | Changes Made |
|------|---------------|----------------|--------------|
| Task 1 | "Best practices for R script setup: shared library files, conditional ggplot2 installation, and data naming conventions." | Recommended the `source()` pattern, `if(!require())` logic for installs, and warned against using `df` as a name. | Created `Task_1.1_Setup.R` for dependencies and data loading; used `source()` in `Task_1.2_Setup.R` to run a test scatter plot. |

> Full prompt logs and screenshots available on request / in appendix.

---

## 5. Reflective Learning
Short reflection per group member on what you learned about R, 
data analysis, and working with GenAI tools.

---

## 6. References
- Lander, J.P. (2014). *R for Everyone*. Ch. 6–7
- Wickham, H. *ggplot2 documentation*. https://ggplot2.tidyverse.org/
- DCU CSC1013 Lecture slides
- Dataset: Kaggle — Beginner Climate Change Dataset

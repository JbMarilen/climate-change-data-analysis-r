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
...

### Task 5 — Histogram
...

### Task 6 — Bar Chart
...

### Task 7 — Scatterplot
...

### Task 8 — Statistical Functions
...

### Task 9 — Filter & Plot (UK)
...

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

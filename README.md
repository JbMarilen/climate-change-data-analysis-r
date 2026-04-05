# R Data Analysis and Visualisation

**Group name:** `sapply(data, pls_clean_me)`  
**Module:** CSC1013 — Introduction to R, Dublin City University  
**Dataset:** Climate Change & Global Warming Dataset (Project 1)  
**Names:** John Bernard Basañes, Kacper Szymoniak, Atharv Soni, Alvaro Lopez  
**IDs:** 70835, 94352, 62750, 60279

This repository contains our group project applying fundamental R programming 
concepts to a real-world climate dataset, covering data cleaning, transformation, 
statistical analysis, and visualisation.

---

## Technologies Used

- **R**
- **ggplot2**
- **tidyverse**
- Base R statistical functions
        
---

## Repository Structure
```
climate-change-data-analysis-r/
│
├── charts/         # Exported chart images (.png)
├── data/           # Raw dataset and exported .csv / .RData files
├── report/         # Project report and AI usage documentation
├── scripts/        # R scripts for each task (Task 1–10)
└── README.md
```

---

## Project Workflow

1. **Data Import** — Load and inspect the dataset
2. **Data Cleaning** — Handle formatting issues, convert types
3. **Data Transformation** — Custom functions, new derived columns
4. **Exploratory Data Analysis** — Statistical summaries, relationships
5. **Visualisation** — Histograms, bar charts, scatterplots via ggplot2
6. **Export** — Processed datasets (.csv, .RData) and charts (.png)

---

## How to Run

1. Open `climate-change-data-analysis-r.Rproj` in RStudio — this sets the working directory automatically
2. Run scripts in order: `Task_1.1` → `Task_1.2` → `Task_2` through `Task_10`
3. Tasks 4–10 depend on the `.rds` file saved by Task 3 — run Task 3 before these
4. All output charts are saved to `charts/` and data files to `data/`

---

## References

- Lander, J.P. (2014). *R for Everyone*. Addison-Wesley. (Ch. 6–7)
- Wickham, H. *ggplot2: Elegant Graphics for Data Analysis*. https://ggplot2.tidyverse.org/
- DCU CSC1013 Lecture Materials

---

## Disclaimer

Submitted as part of CSC1013 coursework at DCU. Shared for educational purposes only.

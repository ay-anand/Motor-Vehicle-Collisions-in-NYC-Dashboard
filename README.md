# Motor Vehicle Collisions Dashboard

## Repository Overview
This repository showcases a professional dashboard for analyzing motor vehicle collisions in NYC, using data from the [Motor Vehicle Collisions - Crashes dataset](https://catalog.data.gov/dataset/motor-vehicle-collisions-crashes). It demonstrates:

- **Data Cleaning**: Addressed over 1 million records, handling null, blank, and anomalous values using R programming.
- **Data Analysis**: Extracted key insights into crash trends, severity, and contributing factors.
- **Interactive Dashboard**: Created a responsive and visually appealing dashboard for dynamic data exploration.

## Repository Contents
- **Raw CSV File**: The original dataset downloaded from the source.
- **Cleaned CSV File**: A refined version of the dataset after data cleaning and transformation in R.
- **R Code**: Scripts for data cleaning and transformation, including handling of missing values and dataset preparation.
- **PDF Report**: An exported PDF version of the Tableau dashboard to ensure accessibility while protecting intellectual property.
- **Project White Paper**: Comprehensive documentation of methodology, insights, and recommendations.

## Dashboard Features
- **Overview of Motor Vehicle Collisions**:
  - Total crashes, injuries, and fatalities.
  - Yearly and monthly trends.
- **Spatial Analysis**:
  - Heatmaps of collision density by NYC boroughs.
  - Interactive maps for pinpointing crash locations.
- **Causal Analysis**:
  - Factors contributing to collisions (e.g., driver behavior, weather).
  - Insights into vehicle type and traffic conditions.
- **Demographic Impact**:
  - Analysis of pedestrian, cyclist, and motorist involvement.
  - Age group and gender-based impact trends.

## Methodology (From Project White Paper)
- **Data Cleaning**:
  - Replaced missing numerical values with the mean and categorical values with the mode.
  - Removed irrelevant columns such as `ZIP CODE` and `CONTRIBUTING FACTOR VEHICLE 2`.
  - Standardized formats for dates, times, and locations.
- **Visualization Techniques**:
  - Heatmaps to show collision density.
  - Bar charts to compare borough-specific data.
  - Line charts to identify trends over time.
  - Pie charts to highlight contributing factors.
- **Interactivity**:
  - Filters for timeframe, borough, and collision causes.

## Dashboard Components and Insights
- **Collision Map**: Highlights hotspots in Manhattan and Brooklyn.
- **Trends Over Time**: Displays declining fatalities since 2022, indicating improved safety measures.
- **Borough Analysis**: Queens and Brooklyn report the highest injuries; Staten Island has the least.
- **Contributing Factors**: Driver inattention and failure to yield are the top contributors.
- **Quick Stats**: Snapshot of total collisions, injuries, and fatalities.

## Key Highlights
- **Dataset Information**:
  - Publisher: NYC OpenData
  - Metadata Updated: January 24, 2025
  - Records: 1,000,000+ rows
  - Category: Public Safety
- **Technologies Used**:
  - **Data Cleaning & Analysis**: R programming
  - **Dashboard Development**: Tableau
  - **Visualization**: ggplot2, dplyr

## Instructions to Run
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/motor-vehicle-collisions-dashboard.git
   ```
2. **Prepare the Environment**:
   - Install required R packages (`tidyverse`, `dplyr`, etc.).
3. **Run Data Cleaning Script**:
   ```bash
   Rscript cleaned_week3_dataset.R
   ```
4. **View the Dashboard Report**:
   - Open the provided PDF file (`Group4_Midterm_Tableau_Project.pdf`).

   **Reason for PDF format**: The PDF format ensures the content is accessible without the need for Tableau Desktop, while protecting the intellectual property of the dashboard.

## Future Work
- **Data Updates**: Automate data fetching and cleaning for newly updated records.
- **Advanced Analytics**: Incorporate machine learning for predictive modeling of collision risks.
- **Enhanced Visuals**: Add more interactivity and detailed visuals for better exploration.

## Acknowledgments
Data sourced from NYC OpenData under public access. The repository reflects analyses and visualizations conducted by **Ayush Anand** and team (Mohit Maithani, Shlok Sharma, Sneha Singh, Ishan Shirvastava).


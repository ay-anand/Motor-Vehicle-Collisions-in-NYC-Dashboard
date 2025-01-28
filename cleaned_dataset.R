
# Load necessary libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(skimr)
library(VIM)
library(dplyr)
library(DataExplorer)

# Read the dataset
data <- read.csv("C:/Users/ayush/Downloads/ALY 6070/Motor_Vehicle_Collisions_-_Crashes.csv")

# Load necessary libraries
library(tidyverse)


# Analyze NA/null values in rows and columns
na_in_rows <- rowSums(is.na(data))
na_in_columns <- colSums(is.na(data))

# Summarize missing values in columns
na_summary <- data.frame(
  Column = names(na_in_columns),
  MissingValues = na_in_columns,
  TotalRows = nrow(data),
  PercentageMissing = (na_in_columns / nrow(data)) * 100
)

# Separate numerical and categorical columns
numerical_columns <- names(data)[sapply(data, is.numeric)]
categorical_columns <- names(data)[sapply(data, is.character)]

# Display null values summary
print("null Values Summary:")
print(na_summary)

# Display numerical and categorical columns
print("Numerical Columns:")
print(numerical_columns)

print("Categorical Columns:")
print(categorical_columns)


# Remove the 'ZIP CODE' column
data <- data %>% select(-`ZIP.CODE`)

# Confirm the column has been removed
print("Columns after removing ZIP CODE:")
print(names(data))


#------------------
# Load necessary libraries
library(dplyr)
library(tidyr)

# Calculate percentage of missing (null) values for each column
missing_summary <- data %>%
  summarise_all(~sum(is.na(.))) %>%
  gather(key = "Column", value = "MissingCount") %>%
  mutate(PercentageMissing = paste0(round((MissingCount / nrow(data)) * 100, 2), "%"))

# Arrange the results in descending order of missing percentage
missing_summary <- missing_summary %>%
  arrange(desc(PercentageMissing))

# Display the summary of missing values
print(missing_summary)
#----------------
# Load necessary libraries
library(dplyr)

# Find distinct values for each column
distinct_values_summary <- lapply(data, function(column) {
  list(
    ColumnName = deparse(substitute(column)),
    DistinctValues = length(unique(column)),
    SampleValues = head(unique(column), 5) # Show up to 5 sample distinct values
  )
})

# Convert the result into a data frame for better readability
distinct_values_df <- data.frame(
  Column = names(data),
  DistinctCount = sapply(data, function(column) length(unique(column))),
  SampleValues = sapply(data, function(column) paste(head(unique(column), 5), collapse = ", "))
)

# Display the summary of distinct values
print(distinct_values_df)





# Calculate blank values (empty strings) for each column
blank_values <- sapply(data, function(column) sum(column == "", na.rm = TRUE))

# Create a summary dataframe
blank_summary <- data.frame(
  Column = names(data),
  BlankCount = blank_values,
  TotalRows = nrow(data),
  PercentageBlank = paste0(round((blank_values / nrow(data)) * 100, 2), "%")
)

# Display the summary of blank values
print("Summary of Blank Values in Each Column:")
print(blank_summary)


# Convert blank spaces to NA in all columns
data <- data %>%
  mutate_all(~ifelse(. == "", NA, .))

# Verify if blank spaces were converted to NA
print("Summary after converting blank spaces to NA:")
print(summary(data))

# Display null values summary
print("null Values Summary:")
print(na_summary)



# Calculate the threshold for 50% null values
threshold <- 0.5 * nrow(data)

# Remove columns with more than 50% null values
data <- data %>%
  select_if(~sum(is.na(.)) <= threshold)

# Check the remaining columns
print("Columns after removing those with more than 50% null values:")
print(names(data_cleaned))

# Verify dimensions of the cleaned dataset
print(paste("Original columns:", ncol(data)))
print(paste("Remaining columns:", ncol(data_cleaned)))
#-----------------
# Function to calculate the mode for categorical columns
calculate_mode <- function(x) {
  uniq <- unique(x[!is.na(x)])  # Exclude NA values
  uniq[which.max(tabulate(match(x, uniq)))]
}

# Replace NA values in categorical columns with mode
categorical_columns <- names(data_cleaned)[sapply(data_cleaned, is.character)]
for (col in categorical_columns) {
  mode_value <- calculate_mode(data_cleaned[[col]])
  data_cleaned[[col]][is.na(data_cleaned[[col]])] <- mode_value
}

# Replace NA values in numerical columns with mean
numerical_columns <- names(data_cleaned)[sapply(data_cleaned, is.numeric)]
for (col in numerical_columns) {
  mean_value <- mean(data_cleaned[[col]], na.rm = TRUE)
  data_cleaned[[col]][is.na(data_cleaned[[col]])] <- mean_value
}

# Verify that all NA values have been replaced
print("Summary of cleaned dataset:")
summary(data_cleaned)




#clened----------------------------------
missing_summary <- data_cleaned %>%
  summarise_all(~sum(is.na(.))) %>%
  gather(key = "Column", value = "MissingCount") %>%
  mutate(PercentageMissing = paste0(round((MissingCount / nrow(data_cleaned)) * 100, 2), "%"))

# Arrange the results in descending order of missing percentage
missing_summary <- missing_summary %>%
  arrange(desc(PercentageMissing))

# Display the summary of missing values
print(missing_summary)

head(data_cleaned)
#----------------
# Remove the column "CONTRIBUTING FACTOR VEHICLE 2"
data_cleaned <- data_cleaned %>% select(-`CONTRIBUTING.FACTOR.VEHICLE.2`)

# Verify that the column has been removed
print("Columns after removing CONTRIBUTING FACTOR VEHICLE 2:")
print(names(data_cleaned))
#---------------------
# Export the cleaned dataset to a CSV file
write.csv(data_cleaned, "Cleaned_Motor_Vehicle_Collisions.csv", row.names = FALSE)

# Confirm export
print("The cleaned dataset has been exported as 'Cleaned_Motor_Vehicle_Collisions.csv'.")
getwd()


#linear regression
library(ggplot2)
setwd("C:/Users/Chanakya/Desktop")
# Read CSV data
data <- read.csv("movies.csv")
data
model <- lm(RATING ~ YEAR + VOTES + RunTime, data = data)
summary(model)

ggplot(data, aes(x = YEAR, y = RATING)) +
  geom_point() +
  labs(title = "RATING vs YEAR", x = "YEAR", y = "RATING")

ggplot(data, aes(x = YEAR, y = RATING)) +
  geom_point() +
  geom_smooth(aes(y = predicted_ratings), method = "lm") +
  labs(title = "RATING vs YEAR with Regression Line", x = "YEAR", y = "RATING")

#polynomial regression

# Load libraries
library(ggplot2)

# Set working directory to your actual path
setwd("C:/Users/Chanakya/Desktop")

# Read the CSV data
data <- read.csv("movies.csv")

# Display the first few rows of the dataset
head(data)

# Check the structure of the dataset
str(data)

# Identify non-numeric values in the YEAR column
non_numeric_years <- data[!sapply(data$YEAR, is.numeric) & !is.na(data$YEAR), "YEAR"]

# Print non-numeric values for inspection
print(non_numeric_years)

# Remove rows with non-numeric YEAR values
data <- data[sapply(data$YEAR, is.numeric) | is.na(data$YEAR), ]

# Convert YEAR to numeric
data$YEAR <- as.numeric(data$YEAR)

if (any(is.na(data$YEAR))) {
  stop("YEAR column contains non-numeric values that could not be converted.")
}
poly_degree <- 2

data$YEAR_poly <- poly(data$YEAR, poly_degree, raw = TRUE)[, 2]

model <- lm(RATING ~ YEAR + YEAR_poly + VOTES + RunTime, data = data)
summary(model)

#logistic regression
library(ggplot2)
setwd("C:/Users/Chanakya/Desktop")
# Read CSV data
data <- read.csv("your_data.csv")

# running Logistic regression model
model <- glm(RATING ~ YEAR + VOTES + RunTime, data = data, family = binomial(link = "logit"))
summary(model)
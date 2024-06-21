install.packages("tidyverse")
install.packages("caret")
install.packages("corrplot")
install.packages("ggplot2")

# Load libraries
library(tidyverse)
library(caret)
library(corrplot)
library(ggplot2)

# Load data
df <- read.csv("C:/Users/Chanakya/Downloads/creditcard.csv")

# Displaying summary statistics
summary(df)

# Displaying column names
colnames(df)

# Checking for missing values
colSums(is.na(df))

# Count of honest vs fraudulent transactions
table(df$Class)

# Proportion of fraudulent transactions
prop_fraud <- round(table(df$Class)[2] / table(df$Class)[1], 4)
print(paste("Proportion of fraudulent transactions:", prop_fraud))

# Display first few rows of the dataset
head(df)


# Box plot without outliers
ggplot(df, aes(x = factor(Class), y = Amount, fill = factor(Class))) +
  geom_boxplot(outlier.shape = NA) +
  ggtitle("Boxplot without Outliers") +
  theme_minimal() +
  labs(x = "Class", y = "Amount") +
  coord_cartesian(ylim = c(0, 300)) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "none",
    plot.margin = margin(1, 1, 1, 1, "cm")
  ) +
  scale_fill_manual(values = c("0" = "blue", "1" = "orange"))


ggplot(df, aes(x = factor(Class), y = Amount)) +
  geom_boxplot() +
  ggtitle("Boxplot with Outliers and Limited Y-Axis") +
  theme_minimal() +
  labs(x = "Class", y = "Amount") +
  coord_cartesian(ylim = c(0, 500))

# Calculate the correlation matrix
corr <- cor(df)

# Visualize the correlation matrix as a heatmap
corrplot(corr, 
         method = "color",  # Color method
         type = "upper",    # Show upper triangle of the matrix
         tl.col = "black",  # Color of the text labels
         tl.cex = 0.8,      # Size of the text labels
         col = colorRampPalette(c("white", "red"))(200)  # Color palette
)


# Filter rows where Class equals 1
df_filtered <- df %>% filter(Class == 1)
df_filtered



# Computiing the Hour column
df <- df %>%
  mutate(Hour = floor(Time / 3600))

# Filtering the data
df_1 <- df %>% filter(Class == 1)
df_0 <- df %>% filter(Class == 0)

# Creating line plots
p1 <- ggplot(df_1, aes(x = Hour, y = Amount)) +
  geom_line(color = "red") +
  ggtitle("Mean Transaction Amount by Hour (Fraudulent)") +
  theme_minimal()

p2 <- ggplot(df_0, aes(x = Hour, y = Amount)) +
  geom_line() +
  ggtitle("Mean Transaction Amount by Hour (Non-Fraudulent)") +
  theme_minimal()

# Arranging the plots side by side
library(gridExtra)
grid.arrange(p1, p2, ncol = 2)

# Standardizing the time and amount columns
df <- df %>%
  mutate(
    Time = scale(Time),
    Amount = scale(Amount)
  )

# Displaying the first few rows of the standardized data
head(df)


# Define the target and predictors
target <- "Class"
predictors <- setdiff(names(df), target)

# Extract predictors and target
x <- df %>% select(all_of(predictors))
y <- df[[target]]

# Split the data into training and testing sets
set.seed(2024)
trainIndex <- createDataPartition(y, p = 0.8, list = FALSE)
x_train <- x[trainIndex, ]
x_test <- x[-trainIndex, ]
y_train <- y[trainIndex]
y_test <- y[-trainIndex]

# Display the dimensions of the training and testing sets
cat("Training set dimensions: ", dim(x_train), "\n")
cat("Testing set dimensions: ", dim(x_test), "\n")


install.packages("DMwR")
library(DMwR)

# Perform SMOTE on the training set
smote_data <- SMOTE(Class ~ ., df[trainIndex, ])

# Extract the over-sampled data
x_train_smote <- smote_data[, predictors]
y_train_smote <- smote_data[, target]

# Display the shape of the re-sampled data set
cat("Resampled dataset shape:", table(y_train_smote), "\n")
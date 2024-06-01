# Load necessary libraries
library(ggplot2)
library(cluster)
athelets <- read.csv(file.choose())

head(athelets)

print(names(athelets))

athelets <- na.omit(athelets)

a_data <- athelets[, c("Age","First.Half" ,"Second.Half", "Finish","Positive.Split" , "Percent.Change")]


set.seed(123)

# Perform k-means clustering with 3 clusters
kmeans_result <- kmeans(a_data, centers = 3, nstart = 20)

# Print the results
print(kmeans_result)

# Add the cluster assignments to the original data set
athelets$Cluster <- as.factor(kmeans_result$cluster)

# Plot the clusters (example using Age and Percentage.Change)
ggplot(athelets, aes(x = Age, y = Percent.Change, color = Cluster)) +
  geom_point(size = 3) +
  labs(
       x = "Age",
       y = "Percentage Change") +
  theme_minimal()

# Evaluate the clustering with a silhouette plot
silhouette_score <- silhouette(kmeans_result$cluster, dist(a_data))
plot(silhouette_score, col = 1:3, border = NA, main='Plot of Kmeans clustering')

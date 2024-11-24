# Load dataset
data <- read.csv("C:/Users/gubba/OneDrive - University of Hertfordshire/git/RPracticals/practical3_n_4/merc.csv")
# Replace with the actual file path

# Check for missing values across all columns
missing_values <- colSums(is.na(data))
print(missing_values)

filtered_data <- data

# Check for missing values in 'tax' and 'mileage'
cat("Missing values in 'tax':", sum(is.na(filtered_data$tax)), "\n")
cat("Missing values in 'mileage':", sum(is.na(filtered_data$mileage)), "\n")

# Remove rows with missing values in 'tax' or 'mileage'
filtered_data <- filtered_data[!is.na(filtered_data$tax) & !is.na(filtered_data$mileage), ]

plot(filtered_data$mpg, filtered_data$price,
     main = "Correlation between Price and MPG",
     xlab = "Miles per Gallon (MPG)",
     ylab = "Price (£)",
     pch = 19,
     col = "blue")

# Add a regression line
model <- lm(price ~ mpg, data = filtered_data)
abline(model, col = "red")

# Pearson correlation test
correlation_result <- cor.test(filtered_data$mpg, filtered_data$price, method = "pearson")
print(correlation_result)

hist(filtered_data$price,
     breaks = 30, # Number of bins
     main = "Distribution of Price with Bell Curve",
     xlab = "Price (£)",
     col = "lightblue",
     border = "black",
     probability = TRUE) # Scale y-axis to probability for the bell curve

# Add a bell curve (normal distribution)
price_mean <- mean(filtered_data$price, na.rm = TRUE) # Mean of price
price_sd <- sd(filtered_data$price, na.rm = TRUE) # Standard deviation of price

curve(dnorm(x, mean = price_mean, sd = price_sd),
      col = "red",
      lwd = 2,
      add = TRUE)
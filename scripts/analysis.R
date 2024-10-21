# Load required libraries
renv::restore()

library(ggplot2)
library(readr)

# Generate some sample data
set.seed(42)
data <- data.frame(
  x = 1:100,
  y = rnorm(100, mean = 0, sd = 1)
)

# Create a plot
p <- ggplot(data, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Sample Linear Regression") +
  theme_minimal()

# Save the plot
ggsave("results/output_plot.png", p, width = 8, height = 6)

# Save the data
write_csv(data, "results/output_data.csv")

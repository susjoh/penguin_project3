
# Load the tidyverse library.

library(tidyverse)

# If the package doesn't exist, run `install.packages("tidyverse")` and then `library(tidyverse)`. You only need to run the install once.
# Read in the data:

penguins <- read.table("data/penguin_data.txt", header = T)
glimpse(penguins)

# Run a linear regression:
model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)

# Create a nice plot in ggplot2:
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  stat_smooth(method = "lm")    
# Save the plot in your /figs folder:
ggsave("figs/1_flipper_bodymass_regression.png") 

#NB. This saves the last plot that was run!
# Subset the data:
penguins_female <- subset(penguins, sex == "female")
# Save the edited dataset:
write_tsv(penguins_female, "results/1_penguin_female_only.txt")

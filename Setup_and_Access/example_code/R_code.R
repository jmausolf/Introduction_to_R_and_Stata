#Load Libraries
library(tidyverse)
library(forcats)

# Load Data
gss <- read_csv("gss_cat.csv")


# Examine Data with Tibble
gss

# Group Data by Age and Marital Status
gss %>%
  filter(!is.na(age)) %>%
  group_by(age, marital) %>%
  count()

# Make a Simple Graph

# Organize the Data to Graph
by_age <- gss %>%
  filter(!is.na(age)) %>%
  group_by(age, marital) %>%
  count() %>%
  mutate(prop = n / sum(n))

# Graph the Data
ggplot(by_age, aes(age, prop)) +
  geom_line(aes(colour = marital))
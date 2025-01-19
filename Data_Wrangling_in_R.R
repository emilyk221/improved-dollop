# load required packages
library(tidyverse)

# set working directory
setwd('C:/Users/emily/OneDrive/Desktop/projects/data-projects/Module_2')

# read csv file and store in variable called 'Salaries_data'
Salaries_data <- read_csv('Salaries.csv')

# store a subset of the data in a new variable 'Salaries_new'
Salaries_new <- Salaries_data %>%
  select(rank, discipline, sex, salary) %>%    # select 4 columns
  filter(!is.na(salary)) %>%                   # filter out missing values
  group_by(rank, discipline, sex) %>%          # group data based on these columns
  count(rank, discipline, sex)                 # count observations

# View(Salaries_new)

# reshape data into wide form using spread()
Salaries_wide <- Salaries_new %>%
  spread(sex, n,  fill=FALSE)

# View(Salaries_wide)

# reshape data back in to long form using gather()
Salaries_long <- Salaries_wide %>%
  gather(sex, n, (ncol(Salaries_wide)-1):ncol(Salaries_wide), na.rm=TRUE)

# View(Salaries_long)

# First , I need to library() required packages

library(here)
library(readxl)
library(tidyverse)

# Importing different worksheets as different data sets

#6.1 I started importing data sets from demographic data

dem12 <- read_xlsx (path = here("Data","nhanes_demo_12_18.xlsx"), 
                   sheet = 1)
dem14 <- read_xlsx (path = here("Data","nhanes_demo_12_18.xlsx"), 
                    sheet = 2)
dem16 <- read_xlsx (path = here("Data","nhanes_demo_12_18.xlsx"), 
                    sheet = 3)
dem18 <- read_xlsx (path = here("Data","nhanes_demo_12_18.xlsx"), 
                    sheet = 4)
# Now, I would like to import data from oral health examination results

oh18 <- read_xlsx (path = here("Data","nhanes_ohx_12_18.xlsx"), 
                   sheet = 1)
oh16 <- read_xlsx (path = here("Data","nhanes_ohx_12_18.xlsx"), 
                   sheet = 2)
oh14 <- read_xlsx (path = here("Data","nhanes_ohx_12_18.xlsx"), 
                   sheet = 3)
oh12 <- read_xlsx (path = here("Data","nhanes_ohx_12_18.xlsx"), 
                   sheet = 4)
# 6.2 Selecting a sub set of variables,only completed oral examinations and 
# only include variables related to id and crown caries

oh18_2 <- oh18 %>% filter(OHDDESTS==1, OHDEXSTS==1) %>%
  select("SEQN",ends_with("CTC"))
oh16_2 <- oh16 %>% filter(OHDDESTS==1, OHDEXSTS==1) %>%
  select("SEQN",ends_with("CTC"))
oh14_2 <- oh14 %>% filter(OHDDESTS==1, OHDEXSTS==1) %>%
  select("SEQN",ends_with("CTC"))
oh12_2 <- oh12 %>% filter(OHDDESTS==1, OHDEXSTS==1) %>%
  select("SEQN",ends_with("CTC"))
# to get ONE data set including all of sub data sets above, 
# I need to append them
mrg <- bind_rows(oh18_2,oh16_2,oh14_2,oh12_2)

#6.3 I would like to add a new variable called year 
# (corresponds to the year of the survey)
dem12$year <- "2012"
dem14$year <- "2014"
dem16$year <- "2016"
dem18$year <- "2018"
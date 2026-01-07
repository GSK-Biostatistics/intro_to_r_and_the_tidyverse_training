 

#### 01_materials_external.R




# 
# install.packages("gskRtraining")
# library("gskRtraining")
# 
# setup_training() 

#### 02_r_rstudio.R




params <-
list(who = "external")

library(tidyverse); theme_set(theme_bw(base_size = 12)) # This sets the default ggplot theme to white
library(haven)

# SAS versions
act <- read_sas("data/act.sas7bdat")
act_full <- read_sas("data/actFull.sas7bdat")
act_long <- read_sas("data/actLong.sas7bdat")
vs <- read_sas("data/vs.sas7bdat")
dm <- read_sas( "data/dm.sas7bdat")
sl <- read_sas( "data/sl.sas7bdat")
theoph <- read_csv("data/theoph.csv")

# Methods of assigning/storing values
x <- 5
y = 6
z <- "GSK"

# Things I have created
objects()

# # Remove all objects from workspace
# rm(list=ls())

try({
# Use values that have been previously stored
x + y

# Now let's do something silly to get a really helpful error message!
x + z
})


weight <- c(70.9, 87.2, 90.8, 68.1, 72.6)
height <- c(170, 185, 178, 175, 180)

weight/ (height / 100)^2

mean(height)


mean_hgt <- mean(height)
bmi <- weight/ (height / 100)^2


# R packages loaded in my session:
search()

# These packages are currently loaded in my environment:
search()

# Run this or the course won't be much fun!
library(tidyverse)

# library(readr)
# library(dplyr)
# library(tidyr)
# # etc. 

#### 03_vectors.R




# Numeric
3 + 7
6 - 14
5*9
100/3

# Character
"Hello! I work at GSK"

# Logical
6 > 7
is.numeric(12)

mode(5)                 # numeric
mode("have a guess")    # character

# Numeric vectors
c(5, 42, 99)
c(6.423, 7.324, 9.225)

# Character vectors
c("I", "have", "four", "elements")

# Create a couple of vectors
vec1 <- c(5,9,2)
vec1
vec2 <- c(7,8,1)
vec2

# Combine the vectors
vec3 <- c(vec1, vec2)
vec3

# Simple sequence
seq(from = 1, to = 10)

# The same, but without specifying the arguments:
seq(1, 10)

# Counting down
seq(80, 60, by = -5)

# Using 'by' and 'length'
seq(from = 1, to = 10, by = 0.5)
seq(from = 10, to = 50, length = 5)

1:50
10:1

# Single values
rep(1, times = 6)
rep("z", times = 3)

# Vectors
vec1  # Reminder of what this is
rep(vec1, times = 4)
rep(vec1, each = 4)
rep(vec1, times = c(5, 4, 6))

# More advanced example
n_subj <- 5
n_visits <- 4
SUBJID <- rep(1:n_subj, each = n_visits)
SUBJID
VISITNUM <- rep(1:n_visits, n_subj)
VISITNUM

# Missing numeric
mis_num <- c(1,2,NA,4)
mis_num

# Missing character
mis_let <- c("G", NA, "K")
mis_let

# Missing logical
mis_log <- c(mis_num > 5)
mis_log

# # Exercise Answers: Data Types and Vectors
# 
# # 1
# library(tidyverse)
# # 2
# my_vec <- c(4, 9, 2, 1, 6, 3)
# my_vec + 1
# my_vec2 <- c(my_vec, NA)
# my_vec2 + 1
# # 3
# 1:20
# # 4
# seq(18, 65, length = 3)
# # 5
# rep("GSK", 50)
# # 6
# rep(1:3, times = c(6, 4, 5))



library(ggplot2)

# Values of interest 
x <- seq(-3, 3, by = .01)
PDF <- dnorm(x)

# Now let's plot using ggplot2
ggplot() + 
  geom_line(aes(x = x, y = PDF))

# Values of interest 
x <- rnorm(200)

# Now let's plot using ggplot2
ggplot() + 
  geom_histogram(aes(x), bins = 20,
                 colour = I("grey"), fill = I("lightblue"))

# Generate some subjects
treatment <- c("GSK", "Other")

# Sample values from this set, with replacement
sample(treatment, 50, replace = TRUE)

# Sample again but this time we want more 'Other' in our population,
# rougly 4 'Other' for every 'GSK' entry
sample(treatment, 50, replace = TRUE, prob=c(1,4))   

# objects("package:datasets")

# In-built airquality data
head(airquality)
tail(airquality)

# Specifying a custom number of rows to display
head(airquality, 1) 

#### 04_data_frames.R




library(tibble)  # NB: loading the dplyr/tidyverse package also loads tibble

air_tib <- tibble(airquality)
air_tib

my_df <- tibble(SUBJID = rep(1:3, each = 2),
               VISITNUM = rep(1:2, 3))
my_df

tibble(HEIGHT = c(182, 164),
       WEIGHT = c(74, 67),
       BMI = WEIGHT^2/HEIGHT)

library(tidyr) 
my_df <- crossing(SUBJID = 1:3, VISITNUM = 1:2)
my_df

library(dplyr)
my_df
# Extract the SUBJID column
pull(my_df, SUBJID)

# # Exercise Answers: Data Frames
# 
# # 1
# my_df <- tibble(SUBJID = 1:20,
#                 AGE = round(runif(20, min = 18, max = 65)),
#                 STATUS = sample(c("Ongoing", "Completed"), 20, replace = TRUE))
# # 2
# crossing(COUNTRY = c("UK", "USA", "FRA"),
#          STATUS = c("Ongoing", "Completed"),
#          TRT = c("GSK", "OTHER")) 

#### 05_importing_and_exporting_data.R




params <-
list(who = "gsk")

library(readr)

# Alternatively
library(tidyverse)

# Read in and save as `theoph`
# The "." represents the current working directory so this is a relative path
theoph <- read_csv("./data/theoph.csv")

# Now print
theoph

# Load the package
library(haven)

# Read in the data (remembering file extension)
dm <- read_sas("./data/dm.sas7bdat")

# View the data
dm    # or try View(dm)

# # What is my current working directory?
# getwd()



# # What files are in the working directory?
# list.files()



# # Set my working directory to where some data are stored
# setwd("/mnt/code/gsk_R_training/data")

# dm <- read_sas("dm.sas7bdat")

# # I have SAS files here:
# sdtm <- "/mnt/code/gsk_R_training/data"
# 
# # Now I want to read in data
# dm <- read_sas( file.path(sdtm, "dm.sas7bdat") )

# # Exercise Answers: Importing
# # 1
# theoph <- read_csv("theoph.csv")
# # 2
# act <- read_sas("act.sas7bdat")

# write_csv(dm, "dm.csv")

# write_csv(dm, "dm_saslike.csv", na = ".") 

#### 06_basic_data_processing.R




library(dplyr)

# Alternatively
# library(tidyverse)

library(ggplot2)
dm <- haven::read_sas("data/dm.sas7bdat")
act <- haven::read_sas("data/act.sas7bdat")
vs <- haven::read_sas("data/vs.sas7bdat")

# Find subjects taking GSK drug.  Note the double-equals
gsk_subj <- filter(dm, ARM == "GSK")
gsk_subj



# Find subjects taking GSK drug in USA
gsk_subj_USA <- filter(dm, ARM == "GSK", COUNTRY == "USA")
gsk_subj_USA
# Or equivalently
gsk_subj_USA <- filter(dm, ARM == "GSK" & COUNTRY == "USA")

# Find females over 50 in France or Germany
filter(dm, SEX=="F", AGE > 50, COUNTRY == "FRA" | COUNTRY == "GER")

# Find females over 50 in France or Germany
filter(dm, SEX=="F", AGE > 50, COUNTRY %in% c("FRA", "GER"))

# Some logical values
some_logic <- c(T, T, F)
some_logic
# Are any of these values TRUE?
any(some_logic)
# Excellent.  Are they all TRUE?
all(some_logic)

# First 3 rows of dm
slice(dm, 1:3)

# Last 3 rows of dm (using the utility function, n())
slice(dm, (n() - 2):n())

# Duplicate records
dup_data <- tibble(USUBJID = rep(c("STD123456:000001", "STD123456:000002"), c(3, 5)),
                   AGE = rep(c(32, 28), c(3, 5)))
dup_data
# Remove duplicate records
distinct(dup_data)

# Find unique combinations
distinct(dm, COUNTRY, ARM)
# Find unique combinations and keep the first instance of each
distinct(dm, COUNTRY, ARM, .keep_all = TRUE)

# Our GSK, USA Subjects from earlier
gsk_subj_USA
# Now that we have GSK subjects in USA we don't need ARM or COUNTRY
select(gsk_subj_USA, USUBJID, AGE, SEX)

# Now that we have GSK subjects in USA we don't need ARM or COUNTRY
select(gsk_subj_USA, -ARM, -COUNTRY)

select(act, starts_with("ACT"))

select(dm, AGE:COUNTRY)

select(dm, ARM, everything())

relocate(dm, ARM, .after = USUBJID)
# Alternatively
#relocate(dm, AGE:COUNTRY, .after = ARM)

# Sort young to old
arrange(dm, AGE)

# Sort old to young
arrange(dm, desc(AGE))

# Sort by multiple variables
arrange(dm, desc(ARM), COUNTRY, desc(AGE))

# # Exercise Answers: Subsetting
# # 1
# filter(act, USUBJID == "STD123456:000005")
# # 2
# filter(act, VISITNUM %in% c(10, 20))
# # 3
# select(act, USUBJID, contains("VIS"))
# # 4
# select(act, -QSDTC)
# # 5
# arrange(act, USUBJID, desc(VISITNUM))

# Create a new column that is the square of the height column
mutate(vs, Height_sq = HEIGHT ^2)

# Create a new flag variable with the value 1
mutate(vs, flag = 1)

mutate(vs, 
       Height_m2 = (HEIGHT/100) ^2, 
       BMI = WEIGHT / Height_m2)

# Rename the COUNTRY column to LOCATION - New name on the left!!!
rename(dm, LOCATION = COUNTRY)

# Rename two columns - New name on the left!!!
rename(dm, LOCATION = COUNTRY, TREATMENT = ARM)

# Extract the AGE column as a vector (not required if using mutate!)
AGE <- pull(dm, AGE)
# Partition into two groups
cut(AGE, c(18, 50, Inf))

# Include 50 years olds in the older group
age_cat <- cut(AGE, c(18, 50, Inf), right = FALSE)
age_cat

around50 <- filter(dm, 48 <= AGE, AGE <= 52)
mutate(around50, 
       AgeCat1 = cut(AGE, c(18, 50, Inf), labels = c("<=50", ">50")),
       AgeCat2 = cut(AGE, c(18, 50, Inf), labels = c("<50", ">=50"), 
                     right = FALSE))  

#### 06_xxx_factors.R




# Extract the SEX column and convert to a factor
SEX <- pull(dm, SEX)
SEX <- factor(SEX)
SEX

# Relabel F and M
library(forcats)
# What is in the package?
objects("package:forcats")

# What is the current order?
SEX

# Re-order females and males
SEX <- lvls_reorder(SEX, c(2, 1))
SEX

# Now in the data, (where we can't see the order unless we sort)
dm_new <- mutate(dm, SEX = lvls_reorder(SEX, c(2, 1)))
arrange(dm_new, SEX)

# Generate some fake count data of favourite colours
colour_data <- tibble(Colour = c("red", "green", "blue"),
                     Count = c(8, 28, 19))

# Create a factor of the Colour column and order by the (descending) Count
# I.e. highest count first
new_colour_data <- mutate(
  colour_data,
  Colour_order = fct_reorder(Colour, Count, .desc = TRUE))

# Plot the data using ggplot2
ggplot(data = new_colour_data) +
  geom_bar(aes(x = Colour_order, y = Count), stat = "identity")

# Extract the data
SEX <- pull(dm, SEX)
SEX
# Relabel F and M to Female and Male
SEX_lab <- lvls_revalue(SEX, c("Female", "Male"))
SEX_lab
# Alternatively we may take this more robust approach
SEX_lab <- fct_recode(SEX, Female = "F", Male = "M")
SEX_lab

# Extratc COUNTRY coloumn
COUNTRY <- pull(dm, COUNTRY)
COUNTRY
# Create Continent by combining countries
Continent <- fct_recode(COUNTRY, 
                        Europe = "UK", Europe = "FRA", 
                        Europe = "GER", Europe = "IRE")
Continent

# Alternatively
Continent <- fct_collapse(COUNTRY, Europe = c("UK", "FRA", "GER", "IRE")) 

#### 06_yyy_stringr.R




# Load the Package
library(stringr)
# What's inside?
objects("package:stringr")

str_length("GSK")  # equivalenetly `nchar("GSK")`

# Some values that we wish to right align
aes <- c(15, 10, 7, 2, 1, 1)

# Add some padding to the left in order to right align the text
ae_pad <- str_pad(aes, 2)
ae_pad

# Or left align for some reason
str_pad(aes, 3, side="right")

# Get rid of the white space that we just added
str_trim(ae_pad)

# Calculate percentages and right-align
ae_perc <- round(100*aes / 30)
ae_perc_pad <- str_pad(ae_perc, 2)

# Joing the padded data together for nicely formatted results
str_c(ae_pad, " (", ae_perc_pad, "%)")

# Create a paragraph of text
some_text <- "When working in a late phase pharmaceutical environment, it is common to have long titles.  But alas, we must fit these long titles within the limited space offered by the L10 format that we use.  Sad face."

# Insert returns in so that it fits within some pre-specified width.
str_wrap(some_text, 108) 

# Create some asthma treatments
treats <- sample(c("ICS", "ICS/LABA"), 10, replace = TRUE)
treats

# Find subjects with LABA component
str_detect(treats, "LABA")

study_conclusion <- "The p-value was less than 0.05"
str_replace(study_conclusion, "less than", "greater than")

messy_text <- c("How did    I   end  up with  so   much white           space?")
# "\\s+" searches for cases with any length of white space
str_replace_all(messy_text, pattern="\\s+", " ")

# # Exercise Answers: String Manipulation
# # 1
# act <- mutate(act, ACTTOT = ACT0101 + ACT0102 + ACT0103 + ACT0104 + ACT0105)
# act
# # 2
# act <- mutate(act, ACTRESP = cut(ACTTOT,
#                                  c(4, 19, 25),
#                                  labels = c("uncontrolled", "controlled")))
# # 3
# act <- mutate(act,
#        VISITNew = factor(VISITNUM),
#        VISITNew = fct_recode(VISITNew,
#                              "Screening" = "10",
#                              "Randomisation" = "20",
#                              "Week 6" = "30",
#                              "Week 12" = "40",
#                              "Week 18" = "50",
#                              "Week 24" = "60",
#                              "Early Withdrawal" = "70"))
# # 4
# act %>%
#   mutate(PHONE_CALL = if_else(condition = str_detect(VISIT, "PHONE CALL"),
#                               true = TRUE, false = FALSE))
# # 5
# act %>% filter(str_detect(QSDTC, "^2012"))
# str_subset(act$QSDTC, "^2012") # alternative answer
# # 6
# SUBJID <- 1:20
# SUBJID_formatted <- str_pad(SUBJID, 6, pad="0")
# USUBJID <- str_c("GSK456789:", SUBJID_formatted)
# USUBJID 

#### 06_zzz_dates.R




library(lubridate)
objects("package:lubridate")

# Some different ways of displaying the same date
a_date_europe <- "15-11-17"
a_date_US <- "11-15-17"
a_date_GSK <- "15-Nov-17"
a_date_programming_standard <- "2017-11-15"

# Some lubridate functions for converting each of thes dates
dmy(a_date_europe)
mdy(a_date_US)
dmy(a_date_GSK)
ymd(a_date_programming_standard)

# A time
lunch_time <- "12:00:00"
hms(lunch_time)
# A date-time
new_year_party_start <- "31-12-2017 21:30:00"
dmy_hms(new_year_party_start, tz = "UTC")

# Today is a
weekdays(today())
# When can I leave?
today() + hours(3)
# DBF is today, how long until SAC?
DBF <- today()
SAC <- DBF + weeks(5)
SAC
# How many days until Christmas?
difftime(ymd("2017-12-25"), today()) 

transmute(vs, 
          Height_m2 = (HEIGHT/100) ^2, 
          BMI = WEIGHT / Height_m2) 

#### 07_magrittr.R




library(tidyverse)
theoph <- read_csv("data/theoph.csv")

# tidyverse loads the dplyr package for filter and select (and the pipe)
library(tidyverse) 
# Start with the theoph data
head(theoph)

# Method 1: nesting (no one likes this)
bl_conc <- select(filter(theoph, TIME == 0), SUBJID, CONC)
# Now check it worked
head(bl_conc)

# Method 2: intermediary datasets
# (better, but leaves us with an object, bl_rows, that we may not want)
bl_rows <- filter(theoph, TIME == 0)
bl_conc <- select(bl_rows, SUBJID, CONC)
# Now check it worked
head(bl_conc)

bl_conc <- theoph %>%      # Take the theoph data, then ...
  filter(TIME == 0) %>%   # ... filter the rows, then ... 
  select(SUBJID, CONC)    # ... select columns

# Now check it worked
bl_conc %>% head

# Pipe into a statement
p_val <- 0.049
p_val %>%
  cat("The p-value is", .)

# Pipe colours into a plot
"red" %>%
  hist(rnorm(100), col = .) 

# # Exercise Answers: Piping
# # 1 a-c
# act_bl <- act %>%
#   filter(VISITNUM == 20) %>%
#   mutate(ACTBL = ACT0101 + ACT0102 + ACT0103 + ACT0104 + ACT0105) %>%
#   select(USUBJID, ACTBL)
# # 2
# # act_bl %>%
# #   write_csv("act_bl.csv") 

#### 08_summaries_aggregation.R




library(tidyverse)
dm <- haven::read_sas("data/dm.sas7bdat")
theoph <- read_csv("data/theoph.csv")

dm %>% 
  summarise(Mean_Age = mean(AGE), SD_Age = sd(AGE))

some_vals <- c(1, NA, 3)
mean(some_vals)
median(some_vals)
min(some_vals)

some_vals <- c(1, NA, 3)
mean(some_vals, na.rm = TRUE)
median(some_vals, na.rm = TRUE)
min(some_vals, na.rm = TRUE)

dm %>% 
  mutate(Mean_Age = mean(AGE), SD_Age = sd(AGE))

dm %>% 
  group_by(ARM)

dm %>% 
  group_by(COUNTRY, SEX)

dm %>% 
  group_by(ARM) %>%
  summarise(N = n())

dm %>% 
  group_by(ARM, COUNTRY) %>%
  summarise(N = n())

# Find the first PK measurement for each subject
theoph %>% 
  group_by(SUBJID) %>%
  slice(1)

# And the last
theoph %>% 
  group_by(SUBJID) %>%
  slice(n())

# # Exercise Answers: Grouping
# # 1
# theoph %>%
#   group_by(SUBJID) %>%
#   summarise(Cmax = max(CONC))
# # 2
# act_basic <- act_long %>%
#   group_by(USUBJID, VISITNUM, VISIT) %>%
#   mutate(ACTTOT = sum(QSSTRESN)) %>%
#   select(-QSTEST, -QSORRES, -QSSTRESN) %>%
#   slice(1)
# # 3
# act_basic %>%
#   group_by(USUBJID) %>%
#   filter(VISITNUM == 20) %>%
#   rename(ACTBL = ACTTOT) %>%
#   select(USUBJID, ACTBL)
# # 4
# act_full %>%
#   group_by(ARM, VISITNUM, VISIT) %>%
#   summarise(N=n(),
#             Mean = mean(ACTTOT),
#             SD = sd(ACTTOT))
# # 5
# act_basic %>%
#   group_by(USUBJID) %>%
#   filter(!any(VISITNUM == 60)) %>%
#   summarise(ACTTOT = min(ACTTOT),
#             WOCF = TRUE)
# 

# Overwrite dm with a grouped version of dm
dm <- dm %>% 
  group_by(ARM, COUNTRY) 
dm
  
# Remove the grouping
dm <- dm %>%
  ungroup()
dm 

#### 09_setting_merging.R




library(tidyverse)
dm <- haven::read_sas("data/dm.sas7bdat")
vs <- haven::read_sas("data/vs.sas7bdat")

# Generate two data frames
interim <- crossing(SUBJID = 1:3, VISITNUM = 1:2)
post_interim <- crossing(SUBJID = 4:5, VISITNUM = 1:2)

# What do they look like?
interim
post_interim

# Combine (set) the data frames
final_data <- bind_rows(interim, post_interim)
final_data

# Generate two data frames
baseline <- tibble(SUBJID = 1, VISITNUM = 1, BASE= 10, AVAL = 10)
post_bl <- tibble(SUBJID = 1, VISITNUM = 2, AVAL= 11)

bind_rows(baseline, post_bl)

# Simply stick the demography and vitals data together
# Scary stuff! But it works since both have the same subjects in the same order
bind_cols(dm, vs)



full_join(dm, vs, by = "USUBJID")

dm_head <- dm %>% head(10) %>% select(-RACE, -ETHNIC) %>% slice(-1)
vs_missing <- vs %>% slice(1, 2, 4, 6, 9, 10)
dm_head
vs_missing

# Join together
full_join(dm_head, vs_missing, by = "USUBJID")

left_join(dm_head, vs_missing, by = "USUBJID")

right_join(dm_head, vs_missing, by = "USUBJID")

inner_join(dm_head, vs_missing, by = "USUBJID")

# Show the records in dm that would be merged if performing an inner/left join
semi_join(dm_head, vs_missing, by = "USUBJID")

# Show the records in dm that would NOT be merged if performing an inner/left join
anti_join(dm_head, vs_missing, by = "USUBJID")

# # Exercise Answers: Setting and Merging
# # 1
# full_join(act, sl, by = "USUBJID")
# # 2
# act_main <- dm %>%
#   full_join(vs, by = "USUBJID") %>%
#   full_join(act, by = "USUBJID") %>%
#   full_join(sl, by = "USUBJID")
# # 3
# wocf <- act_main %>%
#   group_by(USUBJID) %>%
#   filter(!any(VISITNUM == 60)) %>%
#   arrange(ACTTOT) %>%
#   slice(1) %>%
#   mutate(VISITNUM = 60,
#          VISIT = "VISIT 6 (WEEK 24)",
#          VISITNew = "Week 24",
#          WOCF = TRUE)
# act_main <- act_main %>%
#   bind_rows(wocf) %>%
#   arrange(USUBJID, VISITNUM) 

#### 10_transposing.R




library(tidyverse)
vs <- haven::read_sas("data/vs.sas7bdat")
dm <- haven::read_sas("data/dm.sas7bdat")
act <- haven::read_sas("data/act.sas7bdat")
act_full <- haven::read_sas("data/actFull.sas7bdat")

vs %>% 
  pivot_longer(cols = c(HEIGHT,WEIGHT))
# Alternatively
# vs %>% 
#   pivot_longer(cols = HEIGHT:WEIGHT)
# Or else specify columns not to collapse using -
# vs %>% 
#   pivot_longer(cols = -USUBJID)

# Make my vitals data CDISCy
vs %>% 
  pivot_longer(-USUBJID, names_to = "VSTESTCD", values_to = "VSORRES")

# Count the number of subjects in each treatment arm
big_n <- dm %>%
  group_by(ARM) %>%
  summarise(N = n())
big_n

# Now transpose such that each treatment is in a separate column
big_n %>%
  pivot_wider(names_from = ARM, values_from = N)

options(dplyr.summarise.inform = FALSE)
# Show what resulting data frame should look like
act %>%
    pivot_longer(ACT0101:ACT0105, names_to = "Question", values_to = "Score") %>%
    group_by(USUBJID, VISITNUM, VISIT) %>%
    summarise(ACTTOT = sum(Score)) %>% 
    print(n=7)
options(dplyr.summarise.inform = TRUE)

options(dplyr.summarise.inform = FALSE)
# Show what resulting data frame should look like
act_stats <- act_full %>%
  group_by(ARM, VISITNUM, VISIT) %>%
  summarise(
    n = n(),
    Mean = mean(ACTTOT),
    Median = median(ACTTOT),
    SD = sd(ACTTOT),
    Min = min(ACTTOT),
    Max = max(ACTTOT)
  )
act_stats %>%
  pivot_longer(n:Max, names_to = "Stat", values_to = "value") %>%
  pivot_wider(names_from = ARM, values_from = value) %>%
  print(n = 7)
options(dplyr.summarise.inform = TRUE)

# # Exercise Answers: Transposing
# # 1
# act_sum <- act %>%
#   pivot_longer(ACT0101:ACT0105,
#          names_to = "Question", values_to = "Score") %>%
#   group_by(USUBJID, VISITNUM, VISIT) %>%
#   summarise(ACTTOT = sum(Score))
# # 2
# act_stats <- act_full %>%
#   group_by(ARM, VISITNUM, VISIT) %>%
#   summarise(n = n(),
#             Mean = mean(ACTTOT),
#             Median = median(ACTTOT),
#             SD = sd(ACTTOT),
#             Min = min(ACTTOT),
#             Max = max(ACTTOT))
# act_stats %>%
#   pivot_longer(n:Max, names_to = "Stat", values_to = "value") %>%
#   pivot_wider(names_from = ARM, values_from = value)
# # 3
# 
# act_stats <- act_full %>%
#   group_by(ARM, VISITNUM, VISIT) %>%
#   summarise(n = format(n(), nsmall=0),
#             Mean = format(mean(ACTTOT), digits=1, nsmall=1),
#             Median = format(median(ACTTOT), digits=1, nsmall=1),
#             SD = format(sd(ACTTOT),digits=2, nsmall=2),
#             Min = format(min(ACTTOT), nsmall=0),
#             Max = format(max(ACTTOT), nsmall=0))
# 
# act_stats %>%
#   pivot_longer(n:Max, names_to = "Stat", values_to = "value") %>%
#   pivot_wider(names_from = ARM, values_from = value) 

#### 11_statistical_modelling.R




library(tidyverse)
vs <- haven::read_sas("data/vs.sas7bdat")
dm <- haven::read_sas("data/dm.sas7bdat")
act_full <- haven::read_sas("data/actFull.sas7bdat")

pop <- inner_join(dm, vs, by = "USUBJID")
pop

# Fit the model
pop_lm <- lm(WEIGHT ~ HEIGHT, data = pop)
# The default "print" for the model
pop_lm

# Fit the model
pop_lm2 <- lm(WEIGHT ~ HEIGHT + AGE, data = pop)
pop_lm2

#library(forcats)
# Compare all countries against the US so change the order of levels in the data
pop <- pop %>%
  # Move USA to the front
  mutate(COUNTRY = fct_relevel(COUNTRY, "USA"))
# To see what has happened:
 pop%>%pull(COUNTRY)
# Fit the model - we now have a coefficient for all countries except USA
pop_lm3 <- lm(WEIGHT ~ HEIGHT + AGE + COUNTRY , data = pop)
pop_lm3

pop_lm_int <- lm(WEIGHT ~ HEIGHT + AGE + HEIGHT:AGE, data = pop)
# Or equivalently
pop_lm_int <- lm(WEIGHT ~ HEIGHT*AGE, data = pop)
pop_lm_int

# Load the packages
library(modelr)
library(broom)

glance(pop_lm)

augment(pop_lm) %>%
  head

# Augment our data and save it
pop_data_modelled <- augment(pop_lm)


# Create a plot of the studentised residuals against fitted values
library(ggplot2)

ggplot(pop_data_modelled) + 
  geom_point(aes(x = .fitted, y = .std.resid)) +
  geom_hline(yintercept=0, colour = "red")

tidy(pop_lm)

# # Exercise Answers: Modelling
# # 1
# act_post_bl <- act_full %>%
#   filter(20 < VISITNUM, VISITNUM < 70)
# act_mod <- lm(data = act_post_bl, ACTCHGBL ~ ARM + AGE + factor(VISITNUM))
# act_mod
# # 2
# act_mod_aug <- augment(act_mod)
# ggplot(act_mod_aug) +
#   geom_point(aes(x = .fitted, y = .std.resid))
# # 3
# act_mod %>%
#   tidy() %>%
#   filter(p.value < 0.05) 

#### 11_xxx_other_models.R




# Model response using week 24 data
w24 <- act_full %>% 
  filter(VISITNUM == 60)
act_resp_mod <- glm(data = w24, ACTRESP ~  ARM + AGE , 
                  family = "binomial")
tidy(act_resp_mod)

library(mmrm)

# Model to be fitted to scheduled post-BL 'change from BL' data
act_post_bl <- act_full %>% 
  filter(20 < VISITNUM, VISITNUM < 70) %>% 
  # Visit must be a factor, not character.  
  # VISIT 3 will be baseline for comparisons as first factor level
  mutate(visit_factor = factor(VISIT)) # careful of levels in general case!

# Fit unstructured covariance model which assumes:
# REML: `reml = TRUE`
# Satterthwaite DoF: `control = mmrm_control()`
mmrm_mod <- mmrm(
  data = act_post_bl,
  ACTCHGBL ~  ARM + visit_factor + us(visit_factor | USUBJID)
)
tidy(mmrm_mod)

mmrm_mod_kw <- mmrm(
  data = act_post_bl,
  ACTCHGBL ~  ARM + visit_factor + us(visit_factor | USUBJID),
  method = "Kenward-Roger"
)
tidy(mmrm_mod_kw)

library(emmeans)
# Pass the emmeans function the model object and the respective marginal means
# In this case treatment by week (arm by visit)
lsmeans_by_visit <- emmeans(mmrm_mod_kw, ~ ARM | visit_factor)

# Equivalently:
#lsmeans_by_visit <- emmeans(mmrm_mod_kw, "ARM", by= "visit_factor")
# Pretty much equivalently (the attribute difference is beyond course scope)
#lsmeans_by_visit <- lsmeans(mmrm_mod_kw, "ARM", by= "visit_factor")

lsmeans_by_visit

library(survival)

# Some example data from the survival package:
head(lung)   #see help('lung') for further information about the dataset

# Fit the model
cox_mod <- coxph(Surv(time, status) ~ ph.ecog + age, data=lung)
tidy(cox_mod)

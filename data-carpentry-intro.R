# Introductor R, Day 1 PM
# https://datacarpentry.org/R-ecology-lesson/01-intro-to-r.html
# https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html

# Arithmetic
3 + 5
12 / 7

# Assign value to an object
# "<-" is the assignment operator
weight_kg <- 55
weight_kg #shows the value of the object

2.2 * weight_kg
weight_lb <- 2.2 * weight_kg

weight_kg <- 57.5

# This is a comment

# Challenge 1

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

# Answer:
# mass <- 47.5            # mass? 47.5
# age  <- 122             # age? 122
# mass <- mass * 2.0      # mass? 95
# age  <- age - 20        # age? 102
# mass_index <- mass/age  # mass_index? 0.9313725

# Using function
sqrt(9)
?sqrt # Getting help

# Functions and arguments
round(3.14159)
args(round)

round(3.14159, digits = 2) # It's best to use the name of an argument when it's optional 
round(3.14159, 2)

# Vectors
# c() is the combine function to create a vector
weight_g <- c(50, 60, 65, 82)
weight_g

animals <- c("elephant", "narwhal", "otter", "whale")
animals

# First element of a vector
animals[1]

length(animals)

class(animals)
class(weight_g)

# Add to the beginning of a vector
animals <- c("ant",animals)
animals

# Logical: TRUE and FALSE
class(TRUE)
class(FALSE)

# A vector can only contain one data type.
# If there's more than one, R will convert the data type of the elements 
num_char <- c(1, 2, 3, "a") #char
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

num_char
num_logical
char_logical

TRUE + TRUE
"a" + "b"

# Subsetting vectors

animals
animals[2]
animals[c(2,1)]
animals[c(2,1,2,4,3)]

# conditional subsetting
weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g > 50]

# logical vector
weight_g[c(TRUE, TRUE, FALSE, FALSE, TRUE)]

# NA = missing data
heights <- c(2, 4, 4, NA, 6)
mean(heights)
mean(heights, na.rm = TRUE)

na.omit(heights)
heights_no_na <- na.omit(heights)
heights_no_na
mean(heights_no_na)

#
#
# Using the portal dataset

download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

surveys <- read.csv("data_raw/portal_data_joined.csv")

surveys
head(surveys)
View(surveys)

dim(surveys)
nrow(surveys)
ncol(surveys)

summary(surveys)
str(surveys)

animals[1]
surveys[2, 3]
# In subsetting data.frame: row, column

surveys[, 1] #first column
surveys[1 ,] #first row
surveys$species_id

surveys_200 <- surveys[200,]
surveys_200
View(surveys_200)

surveys_top_200 <- surveys[1:200,]

# Factors

levels(surveys$genus)
as.numeric(surveys$genus)
levels(surveys$genus)
levels(surveys$genus)[1] <- "Emmodramus"
surveys$genus

write.csv(surveys, file="data/surveys_edited.csv")

# Barplot

sex <- surveys$sex 
plot(sex)

levels(sex)[1] = "undetermined"
plot(sex)

surveys_no_factors <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = FALSE)

library(tidyverse)

library(lubridate)

my_date <- ymd("2020-03-03")
str(my_date)

ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

missing_dates <- surveys[is.na(surveys$date), c("month", "day", "year")]
surveys$date

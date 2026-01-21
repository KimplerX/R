rm(list = ls())

library(tidyverse)
library(here)

path <- here("data", "SAFI_clean.csv")
interviews <- read_csv(path, na = "NULL")

View(interviews)

class(interviews)

#tibble

dim(interviews)
nrow(interviews)
ncol(interviews)

head(interviews, n=10)
colnames()
rownames()

str(interviews)
summary(interviews)
glimpse(interviews)

library(psych)
describe(interviews$rooms)

interviews[2,1]
interviews[4,3]
interviews[1]

interviews[c(1,4,6)]
interviews[[2]]

interviews[6,]
interviews[,-3]

interviews["village"]
interviews[1:4, "village"]
interviews[["village"]]
interviews$no_membrs

#CHALLENGE

interviews_100 <- interviews[100, ]
interviews_last <- interviews[nrow(interviews), ]
interviews_middle <- interviews[median(1:n_rows), ]
interviews_head <-interviews[-(7:n_rows), ]



respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))

levels(respondent_floor_type)

nlevels(respondent_floor_type)

respondent_floor_type <- fct_recode(respondent_floor_type, brick = "cement")
respondent_floor_type

respondent_floor_type_ordered <- factor(respondent_floor_type,
                                        ordered = TRUE)
respondent_floor_type_ordered

## create a vector from the data frame column "memb_assoc"
memb_assoc <- interviews$memb_assoc

## convert it into a factor
memb_assoc <- as.factor(memb_assoc)

## let's see what it looks like
memb_assoc

plot(memb_assoc)

#####

## create a vector from the data frame column "memb_assoc"
memb_assoc <- interviews$memb_assoc
memb_assoc[is.na(memb_assoc)] <- "undefined"

## convert it into a factor
memb_assoc <- as.factor(memb_assoc)

## let's see what it looks like
memb_assoc

plot(memb_assoc)

#### Dates

library(lubridate)

dates <- interviews$interview_date
class(dates)

interviews$day <- day(dates)
interviews$month <- month(dates)
interviews$year <- year(dates)
interviews

char_dates = c("7/31/2026", "8/8/2026", "4/30/2026")
char_dates

as_date(char_dates, format = "%m/%d/%Y")

ymd(char_dates)
dmy(char_dates)
mdy(char_dates)

interviews$new_date <- ymd(interviews$interview_date)
interviews$new_date


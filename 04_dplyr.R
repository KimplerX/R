library(tidyverse)
library(here)

interviews <- read_csv(here("data", "SAFI_clean.csv"), na = "NULL")
interviews

select(interviews, village, no_membrs, months_lack_food)
interviews[c("village","no_membrs","months_lack_food")]
select(interviews, village:respondent_wall_type)

filter(interviews, village == "Chirodzo")

filter(interviews, village == "Chirodzo",
       rooms > 1,
       no_meals > 2)

filter(interviews, village == "Chirodzo" &
         rooms > 1 &
         no_meals > 2)

filter(interviews, village == "Chirodzo" | village == "Ruaca")


interviews2 <- filter(interviews, village == "Chirodzo")
interviews_ch <- select(interviews2, village:respondent_wall_type)

interviews_ch <- select(filter(interviews, village == "Chirodzo"),
                        village:respondent_wall_type)
interviews_ch


interviews %>%
  filter(village == "Chirodzo") %>%
  select(village:respondent_wall_type)

## CHALLANGE

interviews %>%
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)

## mutate

interviews %>%
  mutate(people_per_room = no_membrs / rooms)

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  mutate(people_per_room = no_membrs / rooms)

interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs)) %>%
  ungroup()

## exclude memb_assoc 
interviews %>%
  filter(!is.na(memb_assoc)) %>% ## new
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs)) 

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) ## new

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
  arrange(min_membrs)

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
  arrange(desc(min_membrs))


interviews %>%
  count(village)

interviews %>%
  count(village, sort = TRUE)
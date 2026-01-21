library(tidyverse)

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")
interviews_plotting

dim(interviews_plotting)

# simple plot
plot(interviews_plotting$no_membrs, interviews_plotting$liv_count,
     main = "Base R Scatterplot",
     xlab = "Number of Household Members",
     ylab = "Number of Livestock Owned")

library(lattice)
xyplot(liv_count ~ no_membrs | village, data = interviews_plotting,
       main = "Lattice Plot: Livestock Count by Household Members",
       xlab = "Number of Household Members",
       ylab = "Number of Livestock Owned")

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items))

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_point() ### added

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.5) # added

# трошки зсуваємо точки, ефект струшування
interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter() # added

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5,
              width = 0.2,
              height = 0.2)

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5,
              color = "blue",
              width = 0.2,
              height = 0.2)

# add legend + color for each village
interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(aes(color = village), size=4, alpha = 0.8, width = 0.2, height = 0.2)

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items, color = village)) +
  geom_count()


interviews_plotting %>%
  ggplot(aes(x = village, y = rooms)) +
  geom_jitter(aes(color = respondent_wall_type),
              alpha = 0.8,
              size = 5,
              width = 0.2,
              height = 0.2)

interviews_plotting |>
  ggplot(aes(x=respondent_wall_type, y=rooms)) +
  geom_boxplot() +
  geom_jitter(alpha=0.5,
              width=0.2,
              color = "tomato",
              size=2,
              height=0.2)

interviews_plotting |>
  
  ggplot(aes(x=respondent_wall_type, y=rooms)) +
  
  geom_violin() +
  
  geom_jitter(alpha = 0.8, 
              
              width = 0.2,
              
              size = 3,
              
              height = 0.2)

percent_wall_type <- interviews_plotting %>%
  filter(respondent_wall_type != "cement") %>%
  count(village, respondent_wall_type) %>%
  group_by(village) %>%
  mutate(percent = (n / sum(n)) * 100) %>%
  ungroup()

percent_wall_type %>%
  ggplot(aes(x = village, y = percent, fill = respondent_wall_type)) +
  geom_bar(stat = "identity", position = "dodge")

percent_wall_type %>%
  ggplot(aes(x = respondent_wall_type, y = percent)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title="Proportion of wall type by village",
       x="Wall Type",
       y="Percent") +
  facet_wrap(~ village)

percent_items <- interviews_plotting %>%
  group_by(village) %>%
  summarize(across(bicycle:no_listed_items, ~ sum(.x) / n() * 100)) %>%
  pivot_longer(bicycle:no_listed_items, names_to = "items", values_to = "percent")
percent_items

percent_items %>%
  ggplot(aes(x = village, y = percent)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ items) +
  labs(title = "Percent of respondents in each village who owned each item",
       x = "Village",
       y = "Percent of Respondents") +
  theme_bw()
install.packages("ggthemes")

library(ggthemes)


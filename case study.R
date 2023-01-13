#Loading a couple packages that I might use
library(tidyverse)
library(skimr)
library(data.table)

setwd("~/R Projects/GA_case_study/csv")
csv_list <- list.files("~/R Projects/GA_case_study/csv")


# Take all dataset csvs and bind them by rows
all_data <- csv_list %>% 
  lapply(fread) %>%
  bind_rows %>%
  drop_na() %>%
  mutate(ride_length_min = as.numeric(round(difftime(ended_at, started_at, units="mins")))) %>%
  subset(ride_length_min > 1) %>%
  rename(account = member_casual)

all_data$date <- as.Date(all_data$started_at)
all_data$year <- format(as.Date(all_data$date), "%Y")
all_data$month <- format(as.Date(all_data$date), "%m")
all_data$day <- format(as.Date(all_data$date), "%d")
all_data$day_of_week <- format(as.Date(all_data$date), "%A")

all_data$day_of_week <- ordered(all_data$day_of_week,
                                levels=c("Sunday",
                                         "Monday",
                                         "Tuesday",
                                         "Wednesday",
                                         "Thursday",
                                         "Friday",
                                         "Saturday"))

# Test Stuff

#average ride time data table

daily_table <- all_data %>%
  group_by(account, day_of_week) %>%
  summarise(number_of_rides = n(), .groups="drop") %>%
  arrange(account, day_of_week)

#Total Rides Per Day
daily_table %>%
  ggplot(aes(x = day_of_week,
             y = number_of_rides,
             fill = account))+
  labs(title="Total Rides Per Day")+
  geom_col(position="dodge")+
  labs(x="Day of Week",
       y="Number of Rides")

#Average Ride Length Per Day
all_data %>%
  group_by(account, day_of_week) %>%
  summarize(average_ride_length = mean(ride_length_min),
            .groups = "drop") %>%
  ggplot(aes(x=day_of_week,
             y=average_ride_length,
             fill=account))+
  geom_col(position="dodge")+
  labs(x = "Day of Week",
       y = "Average Ride Length",
       title="Average Ride Lengths of Casuals Vs. Members")
  

#Rides Per Month
all_data %>%
  group_by(account, month) %>%
  summarize(number_of_rides = n(),
            .groups="drop") %>%
  arrange(account, month) %>%
  ggplot(aes(x=month,
             y=number_of_rides,
             fill=account))+
  geom_col(position="dodge")+
  labs(title="Total Rides Per Month Casuals Vs. Members",
       x = "Month",
       y = "Number of Rides")

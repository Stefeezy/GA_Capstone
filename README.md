# Google Analytics Capstone

# Introduction

This is my capstone project for the Google Analytics Certification course offered through Coursera. I chose one of the default tracks, figuring that it would be best to get my feet wet with a bonafied project with clear goals/tasks rather than come up with my own, where I'd have more wiggle room to slack off on requirements.

# Scenario

You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company's future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Key Questions

Because our task is to analyze given data and devise a plan to convert casual customers into members, it is important to realize the questions we may need to keep in the back of our minds as we go forward.

1.  How do casual riders and members differ?
2.  Why would/should a casual rider switch to a membership? What would be the benefit; is it a worthy change? What makes/would make it worthy.
3.  How can Cyclistic use digital media to influence casual riders to become members?

# Preparing the Data

The course provided us with a database full of monthly rider data. Though the database itself spans back a number of years, the task notifies us to use data from the previous 12 months. After downloading the required .csv files, we have all the data we need to begin our analysis. The first step is getting the data ready for it.

Working with 12 separate .csv files with number of rows in the hundreds of thousands is simply unwieldy. **Luckily, they all follow the same format, in that their columns are named the same, and are in the same order. Because of this, we can consolidate all the files into one data set**.

First, we'll load up the packages required for our analysis.

For this project we'll load up

1.  **tidyverse**, as it provides a number of packages that make cleaning the data easier, and it allows us to create visualizations by containing the **ggplot2** package.
2.  **skimr**, which provides summary statistics for variables in a number of data structures, such as glimpse
3.  **data.table**, which will help us consolidate our data. In truth, I used this particularly for **`fread()`**, which allows us to import our .csv's data *much* faster than `read_csv()` from tidyverse's **readr** package would. This is because `fread()` is better suited for large data sets, and each csv over 100,000 rows.

# The Results
Note that the actual code itself is much smaller than the included markdown file (obviously), and even this is just a summary of that same file. A version used can be downloaded here: https://www.kaggle.com/code/solidbroccoli/google-data-analytics-capstone-cyclistic.

###Total Rides Per Day
![image](https://user-images.githubusercontent.com/21076965/212352410-0740d734-0e45-40fd-81de-4facefab75b0.png)
Casual customers are most likely to take rides on the weekends rather than weekdays. This makes sense, as they are not incentivised to use it daily. That would simply be more money that they'd spend than if they were members.

On the opposite end, members are most likely to take rides on weekdays rather than weekends. More frequent use indicates that they use the bikes for transit needs as the work week begins. Casual members treat the bikes as more of an activity than a necessity, unless they're in a pinch to get somewhere.

###Average Ride Length Per 
![image](https://user-images.githubusercontent.com/21076965/212352543-b3d24439-dec3-4fe7-8888-f668d4400643.png)
On average, casual users actually ride a good deal longer on average than members. This can be attributed to casual users treating it as an activity rather than a necessity. For example, once reaching their workplace, a customer who is a member will not begin another ride until they go home. Simply put, it seems like casual members are getting their moneys worth from their sporadic uses.

###Total Rides Per Month
![image](https://user-images.githubusercontent.com/21076965/212352649-fc1969ad-6b51-416c-b71f-e90e4970a351.png)
Ridership decreases during the winter months across the board. The company operates in Chicago, where winters can be harsh, and icy roads are treacherous.

Ridership increases during summer months, especially with casual users, as more people take advantage of the good weather. That, and the impact of tourists. Note the more narrow curve of the bars representing casuals compared to the more wide distribution of members, who generally keep their riding up throughout the year, as much as they can.

The Rmarkdown file has a section for further considerations regarding potential analysis.

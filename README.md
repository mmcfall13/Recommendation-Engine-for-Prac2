# Recommendation-Engine-for-Prac2
practicum 2 Project Overview


INTRODUCTION

This is a GitHub repository for my practicum two course. My practicum 2 project which was creating a recommendation engine for an online contest I participated in over the 8-week course.  The tools I used for this contest were RStudio, Python with Jupyter Notebook, and Microsoft Excel.

CONTEST OVERIVEW

The contest was hosted by a website called Analytics Vidhya. I have attached a link to the website and contest in case anyone is interested in reading the contest parameters explicitly. https://datahack.analyticsvidhya.com/contest/practice-problem-recommendation-engine/.
The premise of the contest was to create a recommendation engine based off data collected on users that completed programing questions through another source not explicitly addressed in the contest. The dataset is composed of 221,850 submissions of 3,571 users and 6,544 problems, the public/private split was a 60:40 ratio meaning that the contestants get 60 percent of the data and the end grade given by the judges will be based are model’s performance for the remaining 40 percent. The variable for the contest that Analytics Vidhya wanted you to predict and create recommendations for was the “attempts range” which is a column that shows how many attempts a user had before successfully completing the question. The contest gives you three files to clean and combine into one data frame or do as you please. There were no contest restrictions for methods used to create the model and it was a free contest to participate in. The contest will conclude in about 130 days.

CLEANING THE DATA

The data that was given was very messy, the only thing that was nice about the initial data was that it was given in .csv files. For the first file I had 4 columns, which I dropped one immediately that had no value, this left me 3 columns and many NAs that were in each column. Continuing the process, the data values for the points assigned to each question based off of difficulty level (A being the easiest down to M being the hardest) were sporadic and uniformed, one question for difficulty level B even had a point value of -1. To correct this issue, I assigned point values based off of a new system that started with 500-point value for difficulty level A which then was incremented by 500 each level all the way to M which had a value of 6500. Then I dropped the rows that didn’t have a difficulty level type or point value assigned to it which ended up being about 100 rows. Then I started doing inner merges on the problem id followed by a second merge for the third file which was based on user id. This left me with a dataset of 154,726 rows with 14 columns. I later created a pivot table shown in my Jupyter notebook for the SVD model.

EXPLORATORY ANALYSIS

For the exploratory analysis I did a lot of pair plots with the columns given and did the coloration based off of user level, which was on a scale of beginner, intermediate, advanced, and expert. I created an additional pair plot with questions level as the coloration which was based on an A – M rating, there was a clear distinction between groups when it came to max user rating, user rating, and registration time. Unfortunately, the user rating variable wasn’t clearly explained only that it is a rating metric in the contest. Users rated expert user ratings as the highest while higher while the beginner user ratings were rated lowest. Interestingly registration time is also a decent predictor of who is an expert and who is still new to the questions, likely this is due to expert users being familiar with how registration works making it a quicker process. With the question level pair plot it was evident that the attempts range based off question level drastically decrease at 3 attempts which made predicting attempts range difficult.

SVD (SINGLE VALUE DECOMPOSITION) MODEL 

Out of the three models created the SVD model unfortunately performed the worst out of all the models created. This was due to the having difficulties with the initial model in R which I have attached the script to, some of the functions indicated in the script had issues with the data types being passed. Ultimately this let to simplify the matrix I was feeding it, switching to a python model, and creating a pivot table as question for columns and user id as the index and attempts range as the values in the table. Unfortunately, this resulted in many NAs being introduced due to the users not doing a lot of questions, the typical user only accomplished about 2 questions. As a result of this when I created the recommendation engine which recommended the attempts range for the questions that were created from the test set the output showed that the predicted attempts range in the thousands per question. Thus, it was evident the model was performing terribly.

POPULARITY MODEL

The popularity model was the simplest model I created which just gave me the most popular questions based off frequency. I created a score column which gives numeric value of popularity, the scores unfortunately became normalized around the 400 range, which was about 4-5 question down on the popularity recommendations which is indictive of the users only doing one or two questions a piece which makes it difficult to recommend based off popularity. 

COLLABORATIVE FILTERING MODEL

The Collaborative filtering model overall was my best model created but it still didn’t perform that great. The score columns created from this model, which outputs a percentage value of similarity between the question being fed into the recommendation engine and the questions being recommended, the best similarity found was about 20% similarity for the best match.   

ISSUES FACED AND LESSIONS LEARNED

Overall creating the recommender engines was a fun and entertaining task, unfortunately being new to the concept and creating the models caused me to have a slow place. As such I didn’t get to graph the precision/recall split of the models I created. This would have given me another metric to measure model performance and potentially enhance it. Conclusively the data provided was also difficult to use for the assigned task of creating a recommender based off attempts. Nonetheless, if the recommender was designed to recommend based off difficulty it would likely perform better. 

REFERENCES USED IN PROJECT

Jain, A. (2016, June 2). Quick Guide to Build a Recommendation Engine in Python & R. Retrieved from https://www.analyticsvidhya.com/blog/2016/06/quick-guide-build-recommendation-engine-python/.
Le, E. (2017, April 23). How to build a simple song recommender system. Retrieved from https://towardsdatascience.com/how-to-build-a-simple-song-recommender-296fcbc8c85.
Raval, S. (2017, February 8). Building a song recommender. Retrieved from https://github.com/llSourcell/recommender_live/blob/master/Song%20Recommender_Python.ipynb.
Rstudio Script Reference:
Mueller, J. P., Massaron, L. (2016). Machine Learning for Dummies. Hoboken, NJ: John Wiley & Sons, Inc.


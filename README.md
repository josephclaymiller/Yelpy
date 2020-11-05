# Yelpy
An app that allows users to view Yelp restaurants

## User Stories

The following functionality is completed:

- [x] User can view a list of restaurants in SF
- [x] User can view name of each restaurant
- [x] User can view image of each restaurant
- [x] User can view category of each restaurant
- [x] User can view rating of each restaurant
- [x] User can view number of reviews of each restaurant
- [x] User can view phone numbers of each restaurant

## Video Walkthrough

Here is a walkthrough of the implemented user stories:

<img src='yelpy1.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

## Notes
It was challenging formatting the phone numbers and showing the star ratings. 
For the phone numbers I created an extenstion to String that takes as imput "+1xxxxxxxxxx" and returns as output "(xxx) xxx-xxxx".
For the star ratings, I created a struct to return the image file name to be used based on a number between 0 and 5 (in increments of 0.5).

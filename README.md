# Yelpy
An app that allows users to view Yelp restaurants

## User Stories

The following functionality is completed:

- [x] User can view a list of restaurants in SF
- [x] User can view the name of each restaurant
- [x] User can view an image of each restaurant
- [x] User can view the category of each restaurant
- [x] User can view the rating of each restaurant
- [x] User can view the number of reviews of each restaurant
- [x] User can view the phone number of each restaurant

## Video Walkthrough

Here is a walkthrough of the implemented user stories:

<img src='yelpy1.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

## Notes
It was challenging formatting the phone numbers and showing the star ratings. 
For the phone numbers I created an extenstion to String that takes a string formatted as "+1xxxxxxxxxx" and returns a string formatted as "(xxx) xxx-xxxx".
For the star ratings, I created a struct to return the image file name to be used based on a number between 0 and 5 (in increments of 0.5).

# Yelpy
An iPhone app that allows users to view Yelp restaurants.

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
For the phone numbers I extended String with a method `formatPhoneNumber() throws -> String` that is called on a string formatted as "+1xxxxxxxxxx" to return a string formatted as "(xxx) xxx-xxxx". It throws an error if the string is not 12 characters.
For the star ratings, I created a struct called `Stars` that has a dictionary `imageName` of image file names with the keys the numbers 0 through 5 (in increments of 0.5).

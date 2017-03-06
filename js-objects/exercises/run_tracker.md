# Object Exercises


## Run Tracker
One way to break up the complexity of a problem is by using multiple kinds of
objects together, and having each object be responsible for representing a small
part of the problem. But these objects don't need to exist in isolation -
objects can have other objects (or even collections of other objects) as
properties.

Suppose that we wanted to create a simple program ('RunTracker') that helps
people prepare for running a 5k. Each day that a person runs, they create a
record of their run which contains:

-   the date and time of the run
-   the distance covered, in meters
-   the time taken, in seconds

The program also stores information about the user (the user's name and email
address) and can perform some calculations (total distance run, longest run
so far, and average speed).

#### Lab: Diagram and Model

Using the description of the program above, create an entity diagram.

1.  Identify the entities (kinds of objects) needed in the program.
1.  Draw a box for each entity and label it with the singular, capitalized
    entity name.
1.  Connect any entities that are related using a line.
1.  List attributes and methods of each entity separately within each entity's
    box.

## Demo: Write Methods With `this`

```js
let user = {
  name: "Person McFace",
  email: "wdi@personmcface.com",
  runs : [
    {
      date: "2016-05-25 15:00",
      distance: 1200,
      timeTaken: 600
    },
    {
      date: "2016-05-25 15:00",
      distance: 1400,
      timeTaken: 800
    }
  ],

  totalDistance : function() {},
  longestRun : function() {},
  averageSpeed : function() {}
}
```

When we start thinking about how the methods for 'User' will work, we run into a
difficulty. A method for calculating the longest run so far needs to be able to
see, and refer to, all of the runs associated with that particular user. How do
we do that?


## Lab: Self-Referential Objects

In groups, you're going to work on a similar program to our previous one, this
time for meal tracking. In particular, you're going to create an example 'User'
object, complete with several 'Meals'.

A 'User' needs to have:

-   a name (`name`)
-   a date-of-birth (`bornOn`)
-   a target daily calorie intake (`calorieTarget`)
-   a list of 'Meals' that they've eaten (`meals`)

Every 'Meal' must have:

-   a title (`title`), e.g. 'breakfast', 'lunch', 'dinner'
-   a date (`date`), represented as a string e.g. "2016-06-25"
-   a description (`description`)
-   a number of estimated calories (`calories`)

Then, create the following methods for your instance of a 'User':

-   `caloriesEatenOn`, which accepts a date (in the format above) and calculates
    the total number of calories consumed on that date.
-   `avgDailyCalories`, which (as indicated), calculates the average number of
    calories consumed per day, rounded down to the nearest whole calorie.
-   `onTrack`, which compares averageDailyCalories to the User's target daily
    calorie intake, and returns `true` if average caloric intake is at or below
    the target (or `false` if the reverse is true).

Add your code to [`lib/meals.js`](lib/meals.js), structured similarly to
[`lib/runs.js`](lib/runs.js).
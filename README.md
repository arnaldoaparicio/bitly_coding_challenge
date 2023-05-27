# Bitly Backend Engineer Coding Challenge

## Challenge
Create a program that contains an "average minutes" function. This function is given a list of strings, times, and that returns the average number of minutes taken by the competitors to complete the race. Round the returned value to the nearest minute, with .5 rounding up.

## Technologies used
- Ruby 2.7.6
- Bundler 2.3.26

## Installation Guide
This install guide is for MacOS.
1. Open your terminal, and navigate to the directory of your choice.
2. Clone this repository ```$ git clone git@github.com:arnaldoaparicio/bitly_coding_challenge.git```.
3. Head towards the newly cloned directory $ cd bitly_code_challenge.
4. Check to see if you have the correct version of Ruby, ```$ ruby -v```. If you do not have the correct version of Ruby or it is not installed, this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos) should be able to help with installing or upgrading Ruby with Rbenv.

```
$ ruby -v
    ruby 2.7.6p219 (2022-04-12 revision c9c2245c0a) [arm64-darwin20]
```

5. Check to see that Bundler is installed ```$ bundle -v```. If Bundler is not installed, ```$ gem install bundler```.

```
$ bundle -v
Bundler version 2.3.26
```

6. Run Bundler in your terminal to install all dependencies ```$ bundle install```

7. To run all files in the RSpec testing suite ```$ rspec```

```
$ rspec
........

Finished in 0.00317 seconds (files took 0.12843 seconds to load)

15 examples, 0 failures
```

8. Run the application by using the Ruby command along with the average_minutes.rb file and at least one valid time as shown below to calculate and return the average minutes of the boat race.

```
$ ruby lib/average_minutes.rb "02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"
27239
```

## Design Choices
1. ```Sailboat``` class holds time data (e.g: '12:00 PM, DAY 1'): hour, minute, meridiem, finish day. Also keeps track of number of minutes it took to complete race.
2. ```Contestants``` class converts an array of ```times``` to ```Sailboat``` instances. Also checks for the size of array (accepts from 1 to 50 elements in array).
3. ```SailboatRace``` contains all instances of ```Sailboat``` instances. Also calculates the average number of minutes of all Sailboat competitors. By default, the start time is '08:00 AM' and finish day is day 99 but it is also possible to add optional arguments to override these values.
4. ```average_minutes``` run file to accept command-line arguments of ```times``` and calculates the average minutes. Also contains basic error handling.
5. ```RSpec``` testing framework is used for unit and integration tests. Edge case tests are also included.

## 'Playground' version
This version is a branch of my original completed challenge. This was made sometime after finishing the original challenge and was meant to just have some fun with it and add some features that did not make it to the original.

## What's new?
- In ```Sailboat``` class, a new variable was added: ```start_time```. This was meant to allow the user to change the start time of the boat race for a single ```Sailboat``` racer. Default is set to '08:00 AM'
- Also in the ```Sailboat``` class, the ```minutes_lapsed``` method was changed to reflect above changes, thus making it more dynamic.
- In the ```SailboatRace``` class, the ```contestant_average_minutes``` has additional code to change the output. Rather than return the average in minutes, it is converted to days, hours, and minutes. 
Example: ```"Average time: 2 days, 2 hours, 34 minutes"```
- In ```average_minutes```, there is an option to change the start time for all Sailboat racers.
# Bitly Backend Engineer Coding Challenge

## Challenge
Create a program that contains an "average minutes" function. This function is given a list of strings, times, and that returns the average number of minutes taken by the competitors to complete the race. Round the returned value to the nearest minute, with .5 rounding up.

## Technologies used
- Ruby 2.7.6
- Bundler 2.3.26

## Installation Guide
This install guide is for MacOS systems.
1. Open your terminal, and navigate to the directory of your choice.
2. Clone this repository ```$ git clone git@github.com:arnaldoaparicio/bitly_coding_challenge.git```.
3. Head towards the newly cloned directory $ cd bitly_code_challenge.
4. Check to see if you have the correct version of Ruby, ```$ ruby -v```. If you do not have the correct version of Ruby or it is not installed, this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos) should be able to help with installing or upgrading Ruby with Rbenv.

    <code>$ ruby -v <br>
    ruby 2.7.6p219 (2022-04-12 revision c9c2245c0a) [arm64-darwin20]</code>

5. Check to see that Bundler is installed ```$ bundle -v```. If Bundler is not installed, ```$ gem install bundler```.

    <code>$ bundle -v <br>
    Bundler version 2.3.26</code>

6. Run Bundler in your terminal to install all dependencies ```$ bundle install```

7. To run all files in the RSpec testing suite ```$ rspec```

    <code>$ rspec <br>
    ........

    Finished in 0.00317 seconds (files took 0.12843 seconds to load)

    15 examples, 0 failures</code>

8. Run the application by using the Ruby command along with the average_minutes.rb file and at least one valid time as shown below to calculate and return the average minutes of the boat race.

    <code>$ ruby lib/average_minutes.rb "02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"<br>
    27239</code>

require './lib/sailboat_race'
require './lib/sailboat'
require './lib/contestants'

contestants = Contestants.new(["02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"])
race = SailboatRace.new(contestants)

puts race.contestant_average_minutes
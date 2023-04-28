require './lib/sailboat_race'
require './lib/sailboat'
require './lib/contestants'

# Array of times is passed through using user-input.
begin
  contestants = Contestants.new(ARGV)
  race = SailboatRace.new(contestants)

  puts race.contestant_average_minutes

rescue => e
  puts 'Uh Oh! It broke somewhere!'
end
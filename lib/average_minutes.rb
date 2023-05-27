require './lib/sailboat_race'
require './lib/sailboat'
require './lib/contestants'

# Array of times is passed through using user-input.
begin
  contestants = Contestants.new(ARGV)
  ARGV.clear
  puts 'Would you like to change the start time? (Y/n)'
  response = gets.chomp
  if response == 'y'
    puts 'Enter the new start time for this competition (e.g: 07:34 AM)'
    new_time = gets.chomp
    race = SailboatRace.new(contestants, new_time)
  elsif response == 'n'
    race = SailboatRace.new(contestants)
  end
  
  puts race.contestant_average_minutes

rescue => e
  puts 'Uh Oh! It broke somewhere!'
end
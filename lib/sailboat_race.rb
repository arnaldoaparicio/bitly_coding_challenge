class SailboatRace
  attr_reader :competitors, :starting_hour, :starting_minute, :starting_meridian, :max_completion_day

# SailboatRace class with valid competitors, start time/day information, and last race day
# competition_time and max_completion_day have default values but can be overridden
  def initialize(contestants, competition_time = '08:00 AM, DAY 1', max_completion_day = 99)
    @starting_hour = competition_time[0..1]
    @starting_minute = competition_time[3..4]
    @starting_meridian = competition_time[6..7]
    @max_completion_day = max_completion_day
    @competitors = valid_contestants(contestants.all_sailboats)
  end

# Checks that contestants' times are valid and in proper format
  def valid_contestants(all_contestants)
    valid_array = []
    all_contestants.each do |contestant|
      if contestant.finish_day > @max_completion_day || contestant.finish_day == 0
        puts 'Invalid contestant'
      elsif contestant.hour.to_i < 1 || contestant.hour.to_i > 12
        puts 'Invalid contestant'
      elsif !contestant.meridian == 'PM' || !contestant.meridian == 'AM'
        puts 'Invalid contestant'
      elsif contestant.minutes.to_i < 0 || contestant.minutes.to_i > 59
        puts 'Invalid contestant'
      else
        valid_array << contestant
      end
    end
    valid_array
  end

# Finds the average minutes of each contestant for race
  def contestant_average_minutes
    total_minutes = 0
    @competitors.each do |competitor|
      total_minutes += competitor.minutes_lapsed
    end
    (total_minutes.to_f / competitors.length).round
  end
end
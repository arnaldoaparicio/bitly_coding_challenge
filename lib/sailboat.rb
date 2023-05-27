require 'date'
require 'time'

# Sailboat class with all time information
class Sailboat
  attr_reader :hour, :minutes, :meridiem, :finish_day, :start_day
  attr_accessor :start_time

  def initialize(completion_time, start_time = '08:00 AM')
    @hour = format_hour(completion_time)
    @minutes = format('%02d', completion_time[3..4])
    @meridiem = completion_time[6..7]
    @finish_day = formatted_finish_day(completion_time)
    @start_day = 1
    @total_time = 0
    @start_time = start_time
  end

# Formats the finish hour to add leading zeros when necessary for single digit numbers
  def format_hour(completion_time)
    return format('%02d', completion_time[1]) if completion_time[0..1].to_i.digits.length == 1

    format('%02d', completion_time[0..1])
  end

  # Formats Finish day based on String length
  def formatted_finish_day(completion_time)
    return completion_time[14..15].to_i if completion_time.length == 15
    return completion_time[14..15].to_i if completion_time.length == 16
    return completion_time[14..16].to_i if completion_time.length == 17
  end

# Finds the number of minutes taken to complete race for self
  def minutes_lapsed
    if @finish_day > 1
      days_lapsed_in_minutes = ((@finish_day.to_i - 1) * 1440) - ((Time.strptime("#{@start_time}", '%I:%M %P').strftime('%H:%M').to_i * 60) + @start_time[3..4].to_i)
      remainder_time = Time.strptime("#{hour}:#{minutes} #{meridiem}", '%I:%M %P').strftime('%H:%M').to_i * 60
      @total_time = days_lapsed_in_minutes + remainder_time + @minutes.to_i

      @total_time
      
      # recorded_days = @total_time / 1440
      # recorded_hours = (@total_time / 60) % 24
      # recorded_minutes = @total_time % 60

      # p "Time lapsed: #{recorded_days} days, #{recorded_hours} hours, #{recorded_minutes} minutes"
      
      # require 'pry'; binding.pry
      
    elsif @finish_day == 1
      hours_lapsed_in_minutes = Time.strptime("#{hour}:#{minutes} #{meridiem}", '%I:%M %P').strftime('%H:%M').to_i * 60

      (hours_lapsed_in_minutes + @minutes.to_i) - ((Time.strptime("#{@start_time}", '%I:%M %P').strftime('%H:%M').to_i * 60) + @start_time[3..4].to_i)

      # recorded_days = @total_time / 1440
      # recorded_hours = (@total_time / 60) % 24
      # recorded_minutes = @total_time % 60

      # p "Time lapsed: #{recorded_days} days, #{recorded_hours} hours, #{recorded_minutes} minutes"
    end
  end
end

require 'date'
require 'time'

class Sailboat
  attr_reader :hour, :minutes, :meridian, :finish_day, :start_day

  def initialize(completion_time)
    @hour = format_hour(completion_time)
    @minutes = format('%02d', completion_time[3..4])
    @meridian = completion_time[6..7]
    @finish_day = formatted_finish_day(completion_time)
    @start_day = 1
    @total_time = 0
  end

  def format_hour(completion_time)
    return format('%02d', completion_time[1]) if completion_time[0..1].to_i.digits.length == 1

    format('%02d', completion_time[0..1])
  end

  def formatted_finish_day(completion_time)
    return completion_time[14..15].to_i if completion_time.length == 15
    return completion_time[14..15].to_i if completion_time.length == 16
    return completion_time[14..16].to_i if completion_time.length == 17
  end

  def minutes_lapsed
    if @finish_day > 1
      days_lapsed_in_minutes = ((@finish_day.to_i - 1) * 1440) - 480
      remainder_time = Time.strptime("#{hour}:#{minutes} #{meridian}", '%I:%M %P').strftime('%H:%M').to_i * 60
      @total_time = days_lapsed_in_minutes + remainder_time + @minutes.to_i

      @total_time

    elsif @finish_day == 1
      hours_lapsed_in_minutes = Time.strptime("#{hour}:#{minutes} #{meridian}", '%I:%M %P').strftime('%H:%M').to_i * 60

      (hours_lapsed_in_minutes + @minutes.to_i) - 480

    end
  end
end

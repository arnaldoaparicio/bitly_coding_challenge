require 'time'

class Sailboat
  attr_reader :hour, :minutes, :meridian, :finish_day, :start_day

  def initialize(completion_time)
    @hour = format('%02d', completion_time[0..1])
    @minutes = format('%02d', completion_time[3..4])
    @meridian = completion_time[6..7]
    @finish_day = formatted_finish_day(completion_time)
    @start_day = 1
  end

  def formatted_time
    Time.parse("#{hour}:#{minutes} #{meridian}").strftime("%I:%M %p")
  end

  def formatted_finish_day(completion_time)
    return completion_time[14..15].to_i if completion_time.length == 15
    return completion_time[14..15].to_i if completion_time.length == 16
    return completion_time[14..16].to_i if completion_time.length == 17
  end

  def minutes_lapsed
    a = Time.parse("08:00 AM")
    minute = 60
    total_minute = 0
    day = a.day
    
    loop do 
      a = a + minute
      total_minute += 1
      current_day = a.day
      if current_day - day == 1
        @start_day += 1
      end
     if @start_day == @finish_day && formatted_time == Time.parse(a.to_s).strftime("%I:%M %p")
      break
     end
    end
    total_minute
  end
end
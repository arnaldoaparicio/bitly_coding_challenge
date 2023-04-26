require 'time'

class Sailboat
  attr_reader :hour, :minutes, :meridian, :finish_day

  def initialize(completion_time)
    @hour = format('%02d', completion_time[0..1])
    @minutes = format('%02d', completion_time[3..4])
    @meridian = completion_time[6..7]
    @finish_day = completion_time[14..15].to_i

  end

  def formatted_time
    Time.parse("#{hour}:#{minutes} #{meridian}").strftime("%I:%M %p")
  end
end
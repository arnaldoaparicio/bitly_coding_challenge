require 'time'

class Sailboat
  attr_reader :hour, :minutes, :meridian, :finish_day

  def initialize(completion_time)
    # require 'pry'; binding.pry
    @hour = format('%02d', completion_time[0..1]).to_i
    @minutes = format('%02d', completion_time[3..4]).to_i
    @meridian = completion_time[6..7]
    @finish_day = completion_time[14..15].to_i

  end
end
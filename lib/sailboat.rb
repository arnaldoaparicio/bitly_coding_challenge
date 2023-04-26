class Sailboat
  attr_reader :hour, :minutes, :meridian, :finish_day

  def initialize(completion_time)
    # require 'pry'; binding.pry
    @hour = completion_time[0..1]
    @minutes = completion_time[3..4]
    @meridian = completion_time[6..7]
    @finish_day = [14..15]

  end

end
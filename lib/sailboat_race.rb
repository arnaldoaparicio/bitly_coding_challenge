class SailboatRace

  def initialize(contestants, competition_time, max_completion_day)
    @competitors = valid_contestants(contestants)
    @starting_hour = competition_time[0..1]
    @starting_minute = competition_time[3..4]
    @starting_meridian = competition_time[6..7]
    @max_completion_day = max_completion_day
  end

end
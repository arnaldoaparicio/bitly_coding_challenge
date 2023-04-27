class SailboatRace
  attr_reader :competitors, :starting_hour, :starting_minute, :starting_meridian, :max_completion_day

  def initialize(contestants, competition_time, max_completion_day)
    @starting_hour = competition_time[0..1]
    @starting_minute = competition_time[3..4]
    @starting_meridian = competition_time[6..7]
    @max_completion_day = max_completion_day
    @competitors = valid_contestants(contestants.all_sailboats)
  end

  def valid_contestants(all_contestants)
    array = []
    all_contestants.each do |contestant|
      if contestant.finish_day > @max_completion_day || contestant.finish_day == 0
        p 'Invalid completion day'
      elsif contestant.hour.to_i < 1 || contestant.hour.to_i > 12
        p 'Invalid time'
      elsif !contestant.meridian == 'PM' || !contestant.meridian == 'AM'
        p 'Invalid meridian'
      elsif contestant.minutes.to_i < 0 || contestant.minutes.to_i > 59
        p 'Invalid time'
      else
        array << contestant
        p 'success'
      end
    end
    array
  end
end
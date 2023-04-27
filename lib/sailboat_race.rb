class SailboatRace
  attr_reader :competitors, :starting_hour, :starting_minute, :starting_meridian, :max_completion_day

  def initialize(contestants, competition_time, max_completion_day)
    @starting_hour = competition_time[0..1]
    @starting_minute = competition_time[3..4]
    @starting_meridian = competition_time[6..7]
    @max_completion_day = max_completion_day
    @competitors = valid_contestants(contestants.all_sailboats)
    @total_minutes = 0
  end

  def valid_contestants(all_contestants)
    array = []
    all_contestants.each do |contestant|
      if contestant.finish_day > @max_completion_day || contestant.finish_day == 0
        nil
      elsif contestant.hour.to_i < 1 || contestant.hour.to_i > 12
        nil
      elsif !contestant.meridian == 'PM' || !contestant.meridian == 'AM'
        nil
      elsif contestant.minutes.to_i < 0 || contestant.minutes.to_i > 59
        nil
      else
        array << contestant
        # puts 'success'
      end
    end
    array
  end

  def contestant_average_minutes
    @competitors.each do |competitor|
      @total_minutes += competitor.minutes_lapsed
    end
    (@total_minutes.to_f / competitors.length).round
  end
end
require './lib/sailboat_race'
require './lib/sailboat'
require './lib/contestants'
require 'time'

RSpec.describe SailboatRace do
  it 'exists' do
    contestants = Contestants.new(["02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"])
    race = SailboatRace.new(contestants, "08:00 AM, DAY 1", 99)

    expect(race).to be_a SailboatRace
  end

  it 'has attributes' do
    contestants = Contestants.new(["02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"])
    race = SailboatRace.new(contestants, "08:00 AM, DAY 1", 99)

    expect(race.competitors.count).to eq(3)
    expect(race.starting_hour).to eq('08')
    expect(race.starting_minute).to eq('00')
    expect(race.starting_meridian).to eq('AM')
    expect(race.max_completion_day).to eq(99)
  end

  it 'checks all contestants to see if they are valid' do
    contestant_array = ['02:00 PM, DAY 0', '02:00 PM, DAY 20', 
                        '01:58 PM, DAY 100', '01:78 PM, DAY 99', 
                        '31:58 PM, DAY 10', '11:59 PM, DAY 99']
    contestants = Contestants.new(contestant_array)
    race = SailboatRace.new(contestants, '08:00 AM, DAY 1', 99)

    expect(race.competitors.count).to eq(2)
  end

  it 'checks the average minutes of the racers' do
    contestantgroup1 = Contestants.new(['12:00 PM, DAY 1', '12:01 PM, DAY 1'])
    contestantgroup2 = Contestants.new(['12:00 AM, DAY 2'])
    contestantgroup3 = Contestants.new(['02:00 PM, DAY 19', '02:00 PM, DAY 20', '01:58 PM, DAY 20'])

    race1 = SailboatRace.new(contestantgroup1, '08:00 AM, DAY 1', 99)
    race2 = SailboatRace.new(contestantgroup2, '08:00 AM, DAY 1', 99)
    race3 = SailboatRace.new(contestantgroup3, '08:00 AM, DAY 1', 99)

    expect(race1.contestant_average_minutes).to eq(241)
    expect(race2.contestant_average_minutes).to eq(960)
    expect(race3.contestant_average_minutes).to eq(27239)
  end
end

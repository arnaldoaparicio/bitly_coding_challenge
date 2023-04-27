require './lib/sailboat'
require './lib/contestants'
require './lib/sailboat_race'

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
    contestant_group_1 = Contestants.new(['12:00 PM, DAY 1', '12:01 PM, DAY 1'])
    contestant_group_2 = Contestants.new(['12:00 AM, DAY 2'])
    contestant_group_3 = Contestants.new(['02:00 PM, DAY 19', '02:00 PM, DAY 20', '01:58 PM, DAY 20'])

    race_1 = SailboatRace.new(contestant_group_1, '08:00 AM, DAY 1', 99)
    race_2 = SailboatRace.new(contestant_group_2, '08:00 AM, DAY 1', 99)
    race_3 = SailboatRace.new(contestant_group_3, '08:00 AM, DAY 1', 99)

    expect(race_1.contestant_average_minutes).to eq(241)
    expect(race_2.contestant_average_minutes).to eq(960)
    expect(race_3.contestant_average_minutes).to eq(27239)
  end
end
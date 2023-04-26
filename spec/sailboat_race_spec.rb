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
    expect(race.starting_day).to eq(1)
    expect(race.max_completion_day).to eq(99)
  end
end
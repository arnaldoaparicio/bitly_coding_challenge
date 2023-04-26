require './lib/sailboat'
require './lib/contestants'
require './lib/sailboat_race'

RSpec.describe SailboatRace do
  it 'exists' do
    contestants = Contestants.new(["02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"])
    race = SailboatRace.new(contestants)

    expect(race).to be_a SailboatRace
  end
end
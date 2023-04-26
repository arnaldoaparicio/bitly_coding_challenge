require './lib/contestants'
require './lib/sailboat'


RSpec.describe Contestants do
  it 'exists' do
    contestants = Contestants.new(["12:00 PM, DAY 1", "12:01 PM, DAY 1"])

    expect(contestants).to be_a Contestants
  end
end
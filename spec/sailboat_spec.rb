require './lib/sailboat'

RSpec.describe Sailboat do
  it 'exists' do
    sailboat = Sailboat.new("12:00 PM, DAY 1")

    expect(sailboat).to be_a Sailboat
  end

  it 'has attributes' do
    sailboat = Sailboat.new("12:00 PM, DAY 1")

    expect(sailboat.hour).to eq(12)
    expect(sailboat.minutes).to eq(00)
    expect(sailboat.meridian).to eq('PM')
    expect(sailboat.finish_day).to eq(1)
  end
end
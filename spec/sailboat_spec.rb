require './lib/sailboat'
require 'time'

RSpec.describe Sailboat do
  it 'exists' do
    sailboat = Sailboat.new('12:00 PM, DAY 1')

    expect(sailboat).to be_a Sailboat
  end

  it 'has attributes' do
    sailboat = Sailboat.new('12:00 PM, DAY 1')
    
    expect(sailboat.hour).to eq('12')
    expect(sailboat.minutes).to eq('00')
    expect(sailboat.meridian).to eq('PM')
    expect(sailboat.finish_day).to eq(1)
  end

  it 'lists day number 15' do
    sailboat = Sailboat.new('12:00 PM, DAY 15')

    expect(sailboat.finish_day).to eq(15)
  end

  it 'exists with leading zeros' do
    sailboat = Sailboat.new('03:03 AM, DAY 99')

    expect(sailboat.hour).to eq('03')
    expect(sailboat.minutes).to eq('03')
    expect(sailboat.meridian).to eq('AM')
    expect(sailboat.finish_day).to eq(99)
  end

  it 'counts the number of minutes for one competitor within a day' do
    sailboat = Sailboat.new('12:00 PM, DAY 1')
    expect(sailboat.minutes_lapsed).to eq(240)
  end

  it 'counts the number of minutes within a 24 hour span' do
    sailboat = Sailboat.new('08:00 AM, DAY 2')

    expect(sailboat.minutes_lapsed).to eq(1440)
  end
end
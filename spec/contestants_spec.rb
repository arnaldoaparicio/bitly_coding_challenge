require './lib/contestants'
require './lib/sailboat'


RSpec.describe Contestants do
  it 'exists' do
    contestants = Contestants.new(["12:00 PM, DAY 1", "12:01 PM, DAY 1"])

    expect(contestants).to be_a Contestants
  end

  it 'has attributes' do
    contestants = Contestants.new(["12:00 PM, DAY 1", "02:01 PM, DAY 10"])

    expect(contestants.all_sailboats.empty?).to eq(false)
    expect(contestants.all_sailboats.count).to eq(2)
  end

  it 'is invalid when array is empty' do
    contestants = Contestants.new([])

    expect(contestants.all_sailboats).to eq(nil)
  end

  it 'is invalid when array is over 50' do
    contestant_array = ["12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1"]

    contestants = Contestants.new(contestant_array)
    
    expect(contestants.all_sailboats).to eq(nil)
  end

  it 'is valid with 50 contestants' do
    contestant_array = ["12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1",
                        "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1", "12:01 PM, DAY 1"]
    contestants = Contestants.new(contestant_array)

    expect(contestants.all_sailboats.size).to eq(50)
  end
end
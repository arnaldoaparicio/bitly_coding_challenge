class Contestants
  attr_reader :all_sailboats

  def initialize(all_contestants)
    @all_sailboats = format_contestants(all_contestants)
  end

  def format_contestants(all_contestants)
    all_contestants.map do |contestant|
      Sailboat.new(contestant)
    end
  end
end
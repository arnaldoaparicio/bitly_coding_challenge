class Contestants
# Contestants class capable of converting each time to Sailboat instance
  attr_reader :all_sailboats

  def initialize(all_contestants)
    @all_sailboats = format_contestants(all_contestants)
  end

# Converts each time to Sailboat instance
  def format_contestants(all_contestants)
    all_contestants.map do |contestant|
      Sailboat.new(contestant)
    end
  end
end
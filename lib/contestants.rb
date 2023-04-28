class Contestants
# Contestants class capable of converting each time to Sailboat instance
  attr_reader :all_sailboats

  def initialize(all_contestants)
    @all_sailboats = format_contestants(all_contestants)
  end

# Converts each time to Sailboat instance
  def format_contestants(all_contestants)
    if all_contestants.size < 1 || all_contestants.size > 50
      puts 'Invalid amount of competitors'
    else
    all_contestants.map do |contestant|
      Sailboat.new(contestant)
      end
    end
  end
end
require './ship.rb'

# Fleet
class Fleet
  attr_accessor :carrier, :battleship, :cruiser, :submarine, :destoryer

  def initialize
    @carrier = Carrier.new
    @battleship = Battleship.new
    @cruiser = Cruiser.new
    @submarine = Submarine.new
    @destroyer = Destroyer.new
  end

  def all
    [@carrier, @battleship, @cruiser, @submarine, @destroyer]
  end

  def direct_hit?(opponent, missile)
    opponent.fleet.all.each do |ship|
      next if ship.location.nil?

      ship.location.each do |coordinates|
        return ship if coordinates == [missile[:x], missile[:y]]
      end
    end
    false
  end
end

# Carrier
class Carrier < Ship
  def initialize
    @size = 5
    super
  end
end

# Battleship
class Battleship < Ship
  def initialize
    @size = 4
    super
  end
end

# Cruiser
class Cruiser < Ship
  def initialize
    @size = 3
    super
  end
end

# Submarine
class Submarine < Ship
  def initialize
    @size = 3
    super
  end
end

# Destroyer
class Destroyer < Ship
  def initialize
    @size = 2
    super
  end
end

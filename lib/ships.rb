require 'ship.rb'

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

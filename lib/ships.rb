require 'ship.rb'

# Carrier
class Carrier < Ship
  def initialize
    @size = 5
    @health = size
    @type = self.class.name
  end
end

# Battleship
class Battleship < Ship
  def initialize
    @size = 4
    @health = size
    @type = self.class.name
  end
end

# Cruiser
class Cruiser < Ship
  def initialize
    @size = 3
    @health = size
    @type = self.class.name
  end
end

# Submarine
class Submarine < Ship
  def initialize
    @size = 3
    @health = size
    @type = self.class.name
  end
end

# Destroyer
class Destroyer < Ship
  def initialize
    @size = 2
    @health = size
    @type = self.class.name
  end
end

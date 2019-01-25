require './ship.rb'

class Fleet
	attr_accessor :carrier, :battleship, :cruiser, :submarine, :destoryer

	def initialize
		@carrier = Carrier.new
		@battleship = Battleship.new
		@cruiser = Cruiser.new
		@submarine = Submarine.new
		@destroyer = Destroyer.new
	end
end

class Carrier < Ship

	def initialize
		@size = 5
		super
	end
end

class Battleship < Ship
	def initialize
		@size = 4
		super
	end
end

class Cruiser < Ship
	def initialize
		@size = 3
		super
	end
end

class Submarine < Ship
	def initialize
		@size = 3
		super
	end
end

class Destroyer < Ship
	def initialize
		@size = 2
		super
	end
end
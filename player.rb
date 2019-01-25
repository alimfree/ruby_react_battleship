require './fleet.rb'
require './board.rb'

class Player

	attr_accessor :fleet, :board, :opponent

	def initialize()
		@fleet = Fleet.new
		@board = Board.new
		@opponent = 
	end

	def place_ship options={}
		ship = @fleet.send options[:type]
		ship.orientation = options[:orientation]
		ship.coordinates = options[:coordinates]

		if ship.fits?(board) && ship.does_not_overlap?(board)
			board.state[ship.coordinates[:x]][ship.coordinates[:y]] = ship.type
			ship.place_on board
		else
			false 
		end
	end

	def fire_shot(enemy_fleet)
		shots.state
	end
end
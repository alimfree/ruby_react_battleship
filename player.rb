require './fleet.rb'

class Player

	attr_accessor :fleet

	def initialize
		@fleet = Fleet.new
	end

	def place_ship board, options={}
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
end
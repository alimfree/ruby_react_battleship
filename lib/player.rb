require 'fleet.rb'
require 'board.rb'

# Player
class Player
  attr_accessor :fleet, :board, :opponent, :shots_board

  def initialize
    @fleet = Fleet.new
    @board = Board.new
    @shots_board = Board.new
  end

  def place_ship(options)
    ship = @fleet.send options[:type]
    ship.orientation = options[:orientation]
    ship.coordinates = options[:coordinates]

    ship.place_ship ship, board
  end

  def fire(opponent, missile)
    ship = opponent.fleet.direct_hit?(opponent, missile)
    if ship
      ship.hit
      @shots_board.state[missile[:x]][missile[:y]] = 'hit'
    else
      @shots_board.state[missile[:x]][missile[:y]] = 'miss'
    end
    @shots_board
  end
end

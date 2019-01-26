require 'fleet.rb'
require 'board.rb'

# Player
class Player
  attr_accessor :fleet, :board, :shots_fired

  def initialize
    @fleet = Fleet.new
    @board = Board.new
    @shots_fired = Board.new
  end

  def place_ship(options)
    ship = @fleet.send options[:type]
    ship.orientation = options[:orientation]
    ship.coordinates = options[:coordinates]

    ship.add ship, board
  end

  def fire(opponent, missile)
    direct_hit = opponent.fleet.direct_hit?(opponent, missile)
    shots_fired.state[missile[:x]][missile[:y]] = if direct_hit
                                                    'hit'
                                                  else
                                                    'miss'
                                                  end
    @shots_fired
  end
end

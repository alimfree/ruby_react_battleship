require 'ship.rb'
require 'ships.rb'

# Fleet
class Fleet
  attr_reader :carrier, :battleship, :cruiser, :submarine, :destoryer

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
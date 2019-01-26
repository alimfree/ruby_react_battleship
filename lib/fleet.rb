require 'ship.rb'
require 'ships.rb'

# Fleet
class Fleet
  attr_reader :carrier, :battleship, :cruiser, :submarine, :destroyer

  Ships = Struct.new(:carrier, :battleship, :cruiser, :submarine, :destroyer)

  def initialize
    @carrier = Carrier.new
    @battleship = Battleship.new
    @cruiser = Cruiser.new
    @submarine = Submarine.new
    @destroyer = Destroyer.new
  end

  def all
    Ships.new(@carrier, @battleship, @cruiser, @submarine, @destroyer)
  end

  def direct_hit?(opponent, missile)
    opponent.fleet.all.each do |ship|
      next if ship.location.nil?

      ship.location.each do |coordinates|
        if coordinates == [missile[:x], missile[:y]]
          ship.hit
          return true
        end
      end
    end
    false
  end
end

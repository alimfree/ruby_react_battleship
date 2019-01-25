# Board
class Board
  attr_accessor :length, :width, :state

  def initialize(x = 10, y = 0)
    @length = x
    @width = y.zero? ? x : y
    create
  end

  def create
    @state = Array.new(length) { Array.new(width, '') }
  end
end
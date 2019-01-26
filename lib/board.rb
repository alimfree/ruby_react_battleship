# Board
class Board
  attr_accessor :length, :width, :state

  def initialize(x = 10, y = nil)
    @length = x
    @width = y.nil? ? x : y
    create
  end

  def create
    @state = Array.new(length) { Array.new(width, '') }
  end
end

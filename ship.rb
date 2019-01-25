class Ship
	attr_accessor :size, :orientation, :health, :type, :coordinates, :location

  def initialize(orientation = :horizontal)
  	@health = self.size
  	@type = self.class.name
  end

  def hit
  	@health-=1
  end

  def sunk?
  	@health.zero? ? true : false
  end

  def fits? board
  	return false if coordinates[:x] < 0 || coordinates[:y] < 0
		return false if coordinates[:x] + size > board.length
		return false if coordinates[:y] + size > board.width
		return false if	board.length - coordinates[:x] < 0 
		return false if board.width - coordinates[:y] < 0
		true
  end

  def does_not_overlap? board
  	return false if !board.state[coordinates[:x]][coordinates[:y]].empty? 
  	if horizontal?
  		spread_horizontal(board) { |x| return false if !board.state[x][coordinates[:y]].empty? }
  	elsif vertical? 
  		spread_vertical(board) { |y| return false if !board.state[coordinates[:x]][y].empty? }
  	end
  	true
  end

  def place_on board
  	board.state[coordinates[:x]][coordinates[:y]] = type
		spread_horizontal(board) { |x|	board.state[x][coordinates[:y]] = type } if horizontal?
		spread_vertical(board) { |y| board.state[coordinates[:x]][y] = type } if vertical? 
		board
  end

  def spread_horizontal(board=nil)
  	((coordinates[:x])..(coordinates[:x]+size-1)).each { |x| yield(x) }
  end

  def spread_vertical(board=nil)
  	((coordinates[:y])..(coordinates[:y]+size-1)).each { |y| yield(y) }
  end

  def location
	  return spread_horizontal {|x| x }.to_a.map {|x| [x, coordinate[:y]] } if horizontal?
	  spread_vertical {|y| y }.to_a.map {|y| [coordinates[:x],y] } if vertical?
  end

  def horizontal?
  	orientation === :horizontal ? true : false
  end

  def vertical? 
		orientation === :vertical ? true : false
  end
end
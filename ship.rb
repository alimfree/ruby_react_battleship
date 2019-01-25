class Ship
	attr_accessor :size, :orientation, :health, :type, :coordinates, :location

  def initialize(orientation = :horizontal)
  	@health = self.size
  	@type = self.class.name
  end

  def hit
  	@health-=1
  end

  def alive?
  	@health.zero? ? false : true
  end

  def fits? board
  	puts board.length
  	puts coordinates[:y] + size
  	return false if coordinates[:x] < 0 || coordinates[:y] < 0
		return false if coordinates[:x] + size > board.length
		return false if coordinates[:y] + size > board.width
		return false if	board.length - coordinates[:x] < 0 
		return false if board.width - coordinates[:y] < 0
		true
  end

  def does_not_overlap? board
  	return false if !board.state[coordinates[:x]][coordinates[:y]].empty? 

  	case orientation
  	when :horizontal
  		spread_horizontal(board) { |x| return false if !board.state[x][coordinates[:y]].empty? }
  	when :vertical
  		spread_vertical(board) { |y| return false if !board.state[coordinates[:x]][y].empty? }
  	end
  	true
  end

  def place_on board
  	board.state[coordinates[:x]][coordinates[:y]] = type
  	case orientation
		when :horizontal
			spread_horizontal(board) { |x|	board.state[x][coordinates[:y]] = type }
		when :vertical
			puts 'vertical'
			spread_vertical(board) { |y| board.state[coordinates[:x]][y] = type }
		end 
		board
  end

  def hit? opponent, missle
  	opponent.fleet.all.each do |ship|
  	  case orientation
  		when horizontal
  			# ??rizontal |x| { true if missle[:x][:y] ship[:x][:y] }
  		end
  	end
  end

  def spread_horizontal(board = nil)
  	((coordinates[:x])..(coordinates[:x+size-1])).each { |x| yield(x) }
  end

  def spread_vertical(board)
  	((coordinates[:y])..(coordinates[:y]+size-1)).each { |y| yield(y) }
  end

  def location
   spread_horizontal {|x| [coordinates[:x]][x]}
  end

end
# Ship
class Ship
  attr_accessor :size, :orientation, :health, :type, :coordinates,
                def initialize(_orientation = :horizontal)
                  @health = size
                  @type = self.class.name
                end

  def hit
    @health -= 1
  end

  def sunk?
    @health.zero? ? true : false
  end

  def fits?(board)
    return false if out_of_bounds(board)
    return false if negative_coordinates

    true
  end

  def does_not_overlap?(board)
    return false unless board.state[coordinates[:x]][coordinates[:y]].empty?

    return true unless overlap(board)

    true
  end

  def mark(board)
    board.state[coordinates[:x]][coordinates[:y]] = type
    mark_location(board)
    board
  end

  def place_ship(ship, board)
    if ship.fits?(board) && ship.does_not_overlap?(board)
      mark(board)
    else
      false
    end
  end

  def spread_horizontal(_board = nil)
    ((coordinates[:x])..(coordinates[:x] + size - 1)).each { |x| yield(x) }
  end

  def spread_vertical(_board = nil)
    ((coordinates[:y])..(coordinates[:y] + size - 1)).each { |y| yield(y) }
  end

  def location
    if horizontal?
      return spread_horizontal { |x| x }.to_a.map do |x|
        [x, coordinates[:y]]
      end
    end

    spread_vertical { |y| y }.to_a.map { |y| [coordinates[:x], y] } if vertical?
  end

  def horizontal?
    orientation == :horizontal
  end

  def vertical?
    orientation == :vertical
  end

  private

  def mark_location(board)
    handle_orientation(board) do |x|
      board.state[x][coordinates[:y]] = type
    end
    handle_orientation(board) do |y|
      board.state[coordinates[:x]][y] = type
    end
  end

  def out_of_bounds(board)
    return true if out_of_bounds_x(board)
    return true if out_of_bounds_y(board)
  end

  def out_of_bounds_x(board)
    return true if coordinates[:x] + size > board.length
    return true if board.length - coordinates[:x] < 0
  end

  def out_of_bounds_y(board)
    return true if coordinates[:y] + size > board.width
    return true if board.width - coordinates[:y] < 0
  end

  def negative_coordinates
    return true if coordinates[:x] < 0 || coordinates[:y] < 0
  end

  def overlap(board)
    handle_orientation(board) { |i| return true if occupied_space(board, i) }
    false
  end

  def occupied_space(board, i)
    return true if occupied_y(board, i)
    return true if occupied_x(board, i)
  end

  def occupied_x(board, y)
    vertical? && !board.state[coordinates[:x]][y].empty? ? true : false
  end

  def occupied_y(board, x)
    horizontal? && !board.state[x][coordinates[:y]].empty? ? true : false
  end

  def handle_orientation(board)
    orientation = send("#{self.orientation}?")
    send("spread_#{self.orientation}", board) { |b| yield(b) } if orientation
  end
end

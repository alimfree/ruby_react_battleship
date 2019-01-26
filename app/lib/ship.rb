# Ship
# rubocop:disable Metrics/ClassLength
class Ship
  attr_accessor :size, :orientation, :health, :type, :coordinates

  def hit
    alive? ? take_damage : alive?
  end

  def sunk?
    health.zero? ? true : false
  end

  def alive?
    !sunk?
  end

  def fits?(board)
    return false if negative_coordinates
    return false if out_of_bounds(board)

    true
  end

  def space_available?(board)
    return false unless board.state[coordinates[:x]][coordinates[:y]].empty?

    return true unless overlap(board)

    true
  end

  def add(ship, board)
    if ship.fits?(board) && ship.space_available?(board)
      mark(board)
    else
      false
    end
  end

  def location
    if horizontal?
      return spread_horizontal { |x| x }.to_a.map do |x|
        [x, coordinates[:y]]
      end
    end

    spread_vertical { |y| y }.to_a.map { |y| [coordinates[:x], y] } if vertical?
  end

  private

  def mark_location(board)
    handle_orientation(board) do |x|
      mark_horizontal(board, x)
    end
    handle_orientation(board) do |y|
      mark_vertical(board, y)
    end
  end

  def out_of_bounds(board)
    return true if out_of_bounds_x(board)
    return true if out_of_bounds_y(board)
  end

  def out_of_bounds_x(board)
    return true if outside_right_boundary?(board)
    return true if too_large_horizontally?(board)
    return true if outside_left_boundary?(board)
  end

  def out_of_bounds_y(board)
    return true if outside_bottom_boundary?(board)
    return true if too_large_vertically?(board)
    return true if outside_top_boundary?(board)
  end

  def too_large_horizontally?(board)
    return true if coordinates[:x] + size > board.length
  end

  def outside_top_boundary?(board)
    return true if board.width - coordinates[:y] < 0
  end

  def outside_bottom_boundary?(board)
    return true if coordinates[:y] > board.width - 1
  end

  def outside_left_boundary?(board)
    return true if board.length - coordinates[:x] < 0
  end

  def outside_right_boundary?(board)
    return true if coordinates[:x] > board.length - 1
  end

  def too_large_vertically?(board)
    return true if coordinates[:y] + size > board.width
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

  def take_damage
    self.health -= 1
  end

  def mark(board)
    board.state[coordinates[:x]][coordinates[:y]] = self.class.name
    mark_location(board)
    board
  end

  def spread_horizontal(_board = nil)
    ((coordinates[:x])..(coordinates[:x] + size - 1)).each { |x| yield(x) }
  end

  def spread_vertical(_board = nil)
    ((coordinates[:y])..(coordinates[:y] + size - 1)).each { |y| yield(y) }
  end

  def horizontal?
    orientation == :horizontal
  end

  def vertical?
    orientation == :vertical
  end

  def mark_horizontal(board, x)
    board.state[x][coordinates[:y]] = self.class.name if horizontal?
  end

  def mark_vertical(board, y)
    board.state[coordinates[:x]][y] = self.class.name if vertical?
  end
end
# rubocop:enable Metrics/ClassLength

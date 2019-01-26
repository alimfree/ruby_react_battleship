require 'rails_helper'

# rubocop:disable  Metrics/BlockLength
RSpec.describe Ship do
  it 'is an instance of Ship' do
    expect(subject.class.name).to eq 'Ship'
  end

  it 'can get size, health, orientation, type, and coordinates' do
    expect(subject.respond_to?(:size)).to eq true
    expect(subject.respond_to?(:orientation)).to eq true
    expect(subject.respond_to?(:type)).to eq true
    expect(subject.respond_to?(:health)).to eq true
    expect(subject.respond_to?(:coordinates)).to eq true
  end

  it 'can set size, health, orientation, type, and coordinates' do
    can_set_attribute(:size, subject, :size)
    can_set_attribute(:health, subject, :health)
    can_set_attribute(:orientation, subject, :orientation)
    can_set_attribute(:type, subject, :type)
    can_set_attribute(:coordinates, subject, :coordinates)
  end

  it 'can take damage if alive via #hit' do
    subject.health = 5
    expect(subject.hit).to eq 4
  end

  it 'cannot take damage if sunk via #hit' do
    subject.health = 0
    expect(subject.hit).to eq false
  end

  it '#sunk can ruturn true when ship health is zero' do
    subject.health = 6
    7.times { subject.hit } # can't hit ship more than alloted health

    expect(subject.sunk?).to eq true
  end

  it '#sunk returns false when ship health is greater than zero' do
    subject.health = 5

    4.times { subject.hit }
    expect(subject.sunk?).to eq false
  end

  it '#alive returns true when ships health is greater than zero' do
    subject.health = 6
    3.times { subject.hit } # can't hit ship more than alloted health

    expect(subject.alive?).to eq true
  end

  it '#alive returns false when ships health is zero' do
    subject.health = 6
    6.times { subject.hit } # can't hit ship more than alloted health

    expect(subject.alive?).to eq false
  end

  it 'checks ship coordinates are on the board via #fits' do
    subject.coordinates = { x: 0, y: 12 }
    subject.size = 5
    board = Board.new
    fits = subject.fits?(board)
    expect(fits).to eq false
  end

  it 'checks if ship is too large for the board via #fits' do
    subject.coordinates = { x: 0, y: 5 }
    subject.size = 6 # ship is too large for 10*10 board 5+6 is 11

    board = Board.new
    fits = subject.fits?(board)
    expect(fits).to eq false
  end

  it 'determines when ships overlaps another on board #space_available' do
    board = Board.new

    board.state[0][0] = 'Destroyer'
    board.state[0][1] = 'Destroyer'

    subject.coordinates = { x: 0, y: 1 }

    expect(subject.space_available?(board)).to eq false
  end

  it 'shows when board has space avaiable for ship #space_available' do
    board = Board.new

    board.state[0][0] = 'Destroyer'
    board.state[0][1] = 'Destroyer'

    subject.coordinates = { x: 3, y: 3 }
    subject.orientation = :horizontal
    subject.size = 2

    expect(subject.space_available?(board)).to eq true
  end

  it 'returns a verticle ship possible location on board #location' do
    subject.coordinates = { x: 0, y: 0 }

    subject.orientation = :vertical
    subject.size = 3

    possible_location = [[0, 0], [0, 1], [0, 2]]

    expect(subject.location).to eq possible_location
  end

  it 'returns a horizontal ship possible location on board #location' do
    subject.coordinates = { x: 0, y: 0 }

    subject.orientation = :horizontal
    subject.size = 3

    possible_location = [[0, 0], [1, 0], [2, 0]]

    expect(subject.location).to eq possible_location
  end

  it 'adds ship to board #place_ship' do
    subject = Ship.new
    subject.coordinates = { x: 0, y: 0 }
    subject.orientation = :horizontal
    subject.size = 3

    board = Board.new
    expected_board = Board.new
    subject.location.each do |x, y|
      expected_board.state[x][y] = 'Ship'
    end

    expect(subject.add(subject, board).state).to eq expected_board.state
  end

  it 'returns false when fails to add ship to board #place_ship' do
    subject = Ship.new
    subject.coordinates = { x: 11, y: 0 }
    subject.orientation = :horizontal
    subject.size = 3

    board = Board.new

    expect(subject.add(subject, board)).to eq false
  end
end
# rubocop:enable  Metrics/BlockLength

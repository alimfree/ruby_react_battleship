require 'rails_helper'

# rubocop:disable  Metrics/BlockLength
RSpec.describe Player do
  let(:options) do
    {
      type: 'carrier',
      orientation: :horizontal,
      coordinates: { x: 4, y: 0 }
    }
  end

  it 'is an instance of Player class' do
    expect(subject.class.name).to eq 'Player'
  end

  it 'can get fleet, board, and shots_fired' do
    expect(subject.respond_to?(:fleet)).to eq(true)
    expect(subject.respond_to?(:board)).to eq(true)
    expect(subject.respond_to?(:shots_fired)).to eq(true)
  end

  it 'can set fleet, board, and shots_fired' do
    can_set_attribute(:fleet, subject, :fleet)
    can_set_attribute(:board, subject, :boar)
    can_set_attribute(:shots_fired, subject, :shots_fired)
  end

  it 'can add ship to players board via #place_ship' do
    board = subject.place_ship(options)
    [4, 5, 6, 7, 8].each do |x|
      expect(subject.board.state[x][0]).to eq 'Carrier'
    end
    expect(board.class.name).to eq 'Board'
  end

  it 'can log a direct hit via #fire' do
    opponent = fire_at_enemy(x: 4, y: 0)

    expect(subject.shots_fired.state[4][0]).to eq 'hit'
    expect(subject.shots_fired.class.name).to eq 'Board'
    expect(opponent.fleet.carrier.health).to eq 4
  end

  it 'can log a miss fire via #fire' do
    opponent = fire_at_enemy(x: 4, y: 9)

    expect(subject.shots_fired.state[4][9]).to eq 'miss'
    expect(subject.shots_fired.class.name).to eq 'Board'
    expect(opponent.fleet.carrier.health).to eq 5
  end

  it 'checks if player wins #win?' do
    opponent = Player.new
    opponent.fleet.all.each do |ship|
      ship.size.times { ship.hit }
    end

    expect(subject.win?(opponent)).to eq true
  end

  it 'checks if player loses #lose?' do
    subject.fleet.all.each do |ship|
      ship.size.times { ship.hit }
    end

    expect(subject.lose?).to eq true
  end
end
# rubocop:enable  Metrics/BlockLength

def fire_at_enemy(coordinates)
  opponent = Player.new
  opponent.place_ship(options)

  subject.fire(opponent, coordinates)
  opponent
end

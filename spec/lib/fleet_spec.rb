require 'spec_helper'
require 'fleet'
require 'player'

# rubocop:disable  Metrics/BlockLength
RSpec.describe Fleet do

  let(:opponent) do
    options = {
      type: 'carrier',
      orientation: :horizontal,
      coordinates: { x: 4, y: 0 }
    }
    opponent = Player.new
    opponent.place_ship options
    opponent
  end


  it "is an instance of Fleet class" do
    expect(subject.class.name).to eq "Fleet"
  end

  it 'responds to all possible ship types' do
    expect(subject.respond_to?(:carrier)).to eq true
    expect(subject.respond_to?(:battleship)).to eq true
    expect(subject.respond_to?(:cruiser)).to eq true
    expect(subject.respond_to?(:submarine)).to eq true
    expect(subject.respond_to?(:destroyer)).to eq true
  end

  it 'implements #all which returns an array of ships' do
    expect(subject.all.length).to eq 5
    ships = %w[Carrier Battleship Cruiser Submarine Destroyer]

    subject.all.each do |ship|
      expect(ships.include?(ship.class.name)).to eq true
    end
  end

  it 'implements #direct_hit? which returns true if an opponents ship is hit' do
    [4, 5, 6, 7, 8].each do |i|
      expect(subject.direct_hit?(opponent, x: i, y: 0)).to eq true
    end
  end

  it '#direct_hit? returns false if an oppnents ship is not hit' do
    expect(subject.direct_hit?(opponent, x: 9, y: 0)).to eq false
  end
end
# rubocop:enable  Metrics/BlockLength

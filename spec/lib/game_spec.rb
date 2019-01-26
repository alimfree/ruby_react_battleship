require 'spec_helper'
require 'game'

RSpec.describe Game do
  it 'is an instance of Game' do
    expect(subject.class.name).to eq 'Game'
  end

  it 'includes players as attributes' do
    expect(subject.respond_to?(:player_one)).to eq true
    expect(subject.respond_to?(:player_two)).to eq true

    expect(subject.player_one.class.name).to eq 'Player'
    expect(subject.player_two.class.name).to eq 'Player'
  end

  it 'finds when game ends #over' do
    player_one_wins
    expect(subject.over?).to eq true
  end

  it 'checks if #player_one_wins' do
    subject.player_two.fleet.all.each do |ship|
      ship.size.times { ship.hit }
    end

    expect(subject.player_one_wins?).to eq true
  end

  it 'checks if #player_two_wins' do
    player_one_wins
    expect(subject.player_two_wins?).to eq true
  end
end

def player_one_wins
  subject.player_one.fleet.all.each do |ship|
    ship.size.times { ship.hit }
  end
end

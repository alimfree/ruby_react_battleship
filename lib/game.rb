# Game
class Game
  attr_accessor :player_one, :player_two

  def initialize
    @player_one = Player.new
    @player_two = Player.new
  end

  def over?
    player_one_wins? || player_two_wins? ? true : false
  end

  def player_one_wins?
    player_two.lose? == true
  end

  def player_two_wins?
    player_one.lose? == true
  end
end

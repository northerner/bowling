require_relative 'player'

class Game
  attr_accessor :players

  def initialize(players)
    @players = players
  end

  def next_round
    @players.each do |player|
      puts "Enter #{player.name}'s first roll score: "
      first_roll_score = gets.chomp.to_i
      if first_roll_score == 10
        player.new_roll 10
        puts "STRIKE"
      else
        player.new_roll first_roll_score
        puts "Enter #{player.name}'s second roll score: "
        second_roll_score = gets.chomp.to_i
        player.new_roll second_roll_score
      end
    end
  end

  def print_scores
    puts "----- Scores -----"
    @players.each do |player|
      puts "#{player.name}: #{player.score}"
    end
    puts "----- ------ -----"
  end



end

puts "----- Bowling -----"
puts "How many players?"
player_count = gets.chomp

@players = []
player_count.to_i.times do
  puts "Player name: "
  name = gets.chomp
  @players << Player.new(name)
end

game = Game.new(@players)
10.times do
  game.next_round
  game.print_scores
end

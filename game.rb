require_relative 'player'

class Game

end

puts "----- Bowling -----"
puts "How many players?"
player_count = gets.chomp

@players = []
player_count.times do
  puts "Player name: "
  name = gets.chomp
  @players << Player.new(name)
end

game = Game.new(@players)

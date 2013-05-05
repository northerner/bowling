require_relative 'player'

class Game
  attr_accessor :players

  def initialize(players)
    @players = players
    @round = 0
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
    @round += 1
  end

  def print_scores
    puts "-----------------"
    puts "Round: #{@round} - Scores"
    puts "-----------------"
    @players.each do |player|
      print_scoresheet player
    end
    puts
  end

  def print_scoresheet(player)
    puts player.name
    player.frames.each do |frame|
      if frame.score == 10
        case frame.strike_or_spare
          when :strike
            print "| |X| "
          when :spare
            print "| |#{frame.first_roll}|/"
        end
      else
        print "| |#{frame.first_roll}|#{frame.second_roll}"
      end
    end
    print "| Total Score: #{player.score}"
    puts
  end 


end

puts "----- Bowling -----"

# get player names
puts "How many players?"
player_count = gets.chomp
@players = []
player_count.to_i.times do
  puts "Player name: "
  name = gets.chomp
  @players << Player.new(name)
end

# game loop 10 rounds
game = Game.new(@players)
10.times do
  game.next_round
  game.print_scores
end

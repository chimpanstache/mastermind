require_relative 'mastermind'
require_relative 'computer'

class GameEngine < Mastermind

  def game_cheat
    puts "cheat : #{@@game[0]} | #{@@game[1]} | #{@@game[2]} | #{@@game[3]} "
  end

  def output
    puts "#{@@guess[0]} | #{@@guess[1]} | #{@@guess[2]} | #{@@guess[3]} " +
         ">>> black : #{@@score.count('B')}, white : #{@@score.count('W')}"
  end

  def guesser_or_creator
    puts "You prefer being the guesser, or creator ?"
    gets.chomp
  end

  def play_guesser
    puts "choose your combination :"
    computer = Computer.new
    10.times do
      @@guess = gets.chomp
      @@score = computer.calculate_score(@@guess, @@game)
      output
      if @@score == "BBBB"
        puts 'You win!'
        return
      end
    end
    puts 'You lost!' if @@score != "BBBB"
  end

  def play_creator
    puts "choose the combination the computer will have to guess :"
    @@game = gets.chomp
    puts "loading..."
    computer = Computer.new
    computer.init
    10.times do
      computer.play
      game_cheat
      output
      if @@score == "BBBB"
        sleep(1)
        puts 'Computer wins!'
        return
      end
    end
    sleep(1)
    puts 'You win!' if @@score != "BBBB"
  end

  def play
    loop do
      user_choice = guesser_or_creator
      if user_choice == "creator"
        play_creator
        return
      elsif user_choice == "guesser"
        play_guesser
        return
      else
        puts "invalid answer, please type again"
      end
    end
  end
end

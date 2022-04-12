require_relative 'mastermind'
require_relative 'computer'
require_relative 'game_logic'

class GameEngine < Mastermind
  def parse_input(input)
    @@guess = input.split(' ')
  end

  def game_cheat
    puts "cheat : #{@@game[0]} | #{@@game[1]} | #{@@game[2]} | #{@@game[3]} "
  end

  def output
    puts "#{@@guess[0]} | #{@@guess[1]} | #{@@guess[2]} | #{@@guess[3]} " +
         ">>> black : #{@@feedback[:black]}, white : #{@@feedback[:white]}"
  end

  def guesser_or_creator
    puts "You prefer being the guesser, or creator ?"
    gets.chomp
  end

  def play_guesser
    puts "choose your combination :"
    10.times do
      user_input = gets.chomp
      parse_input(user_input)
      GameLogic.round_play
      game_cheat
      output
      if @@feedback[:black] == 4
        puts 'You win!'
        break
      end
    end
    puts 'You lost!' if @@feedback[:black] != 4
  end

  def play_creator
    puts "choose the combination the computer will have to guess :"
    @@game = gets.chomp
    computer = Computer.init
    10.times do
      computer.play
      output
      if @@feedback[:black] == 4
        puts 'Computer wins!'
        break
      end
    end
    puts 'You win!' if @@feedback[:black] != 4
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

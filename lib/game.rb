require_relative 'mastermind'

class Game
  attr_accessor :game, :feedback, :guess

  include MasterMind

  def init
    @game = COLORS.sample(4)
    @feedback = { "black": 0, "white": 0 }
  end

  def parse_input(input)
    @guess = input.split(' ')
  end

  def white_count
    game_temp = @game
    guess_temp = @guess
    comp = game_temp.zip(guess_temp)
    comp = comp.delete_if { |sub_arr| sub_arr.uniq.length == 1 }
    comp = comp.transpose
    game_temp = comp[0]
    guess_temp = comp[1]
    i = guess_temp.size

    until game_temp.empty?
      guess_temp.delete_at(guess_temp.index(game_temp[0]) || guess_temp.length)
      game_temp.delete_at(0)
    end
    @feedback[:white] = i - guess_temp.size
  end

  def black_count
    comp = @game.zip(@guess)
    length_arr = []
    comp.map { |sub_arr| length_arr.push(sub_arr.uniq.length) }
    @feedback[:black] = length_arr.select { |num| num == 1 }.length
  end

  def compare_arrays
    black_count
    white_count
  end

  def game_cheat
    puts "cheat : #{@game[0]} | #{@game[1]} | #{@game[2]} | #{@game[3]} "
  end

  def output
    puts "#{@guess[0]} | #{@guess[1]} | #{@guess[2]} | #{@guess[3]} " +
         "||| black : #{@feedback[:black]}, white : #{@feedback[:white]}"
  end

  def play
    init

    10.times do
      user_input = gets.chomp
      parse_input(user_input)
      compare_arrays
      game_cheat
      output
      if @feedback[:black] == 4
        puts 'You win!'
        break
      end
    end
    puts 'You lost!' if @feedback[:black] != 4
  end
end

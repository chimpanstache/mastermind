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

  def same_color
    comp = @game.zip(@guess)
    h = comp.delete_if { |sub_arr| sub_arr.uniq.length == 1 }.flatten.tally
    feedback[:white] = h.delete_if { |_k, v| v < 2 }.count
  end

  def same_color_place
    comp = @game.zip(@guess)
    length_arr = []
    comp.map { |sub_arr| length_arr.push(sub_arr.uniq.length) }
    @feedback[:black] = length_arr.select { |num| num == 1 }.length
  end

  def compare_arrays
    same_color_place
    same_color
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

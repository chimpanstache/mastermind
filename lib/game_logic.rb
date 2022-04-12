require_relative 'mastermind'

class GameLogic < Mastermind
  attr_accessor :game, :feedback, :guess

  def self.white_count
    game_temp = @@game
    guess_temp = @@guess
    comp = game_temp.zip(guess_temp)
    comp = comp.delete_if { |sub_arr| sub_arr.uniq.length == 1 }.transpose
    game_temp = comp[0]
    guess_temp = comp[1]
    i = guess_temp.size

    until game_temp.empty?
      guess_temp.delete_at(guess_temp.index(game_temp[0]) || guess_temp.length)
      game_temp.delete_at(0)
    end
    @@feedback[:white] = i - guess_temp.size
  end

  def self.black_count
    comp = @@game.zip(@@guess)
    length_arr = []
    comp.map { |sub_arr| length_arr.push(sub_arr.uniq.length) }
    @@feedback[:black] = length_arr.select { |num| num == 1 }.length
  end

  def self.compare_arrays
    return if black_count == 4
    white_count
  end

  def self.round_play
    compare_arrays
  end
end

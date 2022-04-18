require_relative 'mastermind'
require 'byebug'

class GameLogic < Mastermind
  attr_accessor :game, :feedback, :guess

  def self.calculate_score(guess, answer)
    score = ""
    wrong_guess_pegs, wrong_answer_pegs = [], []
    peg_pairs = guess.chars.zip(answer.chars)

    peg_pairs.each do |guess_peg, answer_peg|
      if guess_peg == answer_peg
        score << "B"
      else
        wrong_guess_pegs << guess_peg
        wrong_answer_pegs << answer_peg
      end
    end

    wrong_guess_pegs.each do |peg|
      if wrong_answer_pegs.include?(peg)
        wrong_answer_pegs.delete(peg)
        score << "W"
      end
    end
    score
  end

  def self.round_play
    @@score = calculate_score(@@guess, @@game)
  end
end

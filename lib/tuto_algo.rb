require 'set'
require 'byebug'
class TutoAlgo

  def initialize
    colors = "123456".chars
    @all_answers = colors.product(*[colors] * 3).map(&:join)
    @all_scores = Hash.new { |h, k| h[k] = {} }
  
    @all_answers.product(@all_answers).each do |guess, answer|
      @all_scores[guess][answer] = calculate_score(guess, answer)
    end

    @all_answers = @all_answers.to_set
  end


  def play
    @guesses = 0
    @answer = 4.times.map { "123456".chars.sample }.join 
    @possible_scores = @all_scores.dup
    @possible_answers = @all_answers.dup
  
    while @guesses < 10
      @guess = make_a_guess
      if @all_answers.include?(@guess)
        @guesses += 1
        @score = calculate_score(@guess, @answer)
        if @score == "BBBB"
          p [@guesses, @guess]
          break
        end
      end
    end
  end

  def calculate_score(guess, answer)
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

  # def make_a_guess
  #   if @guesses > 0
  #     puts "Score: #{@score}"
  #   else
  #     puts
  #   end

  #   puts "Guesses Remaining: #{10 - @guesses}"
  #   print "Guess: "
  #   gets.chomp
  # end

  def make_a_guess 
    if @guesses > 0
      puts "Score: #{@score}"
      puts "Guesses Remaining: #{10 - @guesses}"
      puts "Answer: #{@answer}"

      @possible_answers.keep_if { |answer| @all_scores[@guess][answer] == @score }
      guesses = @possible_scores.map do |guess, scores_by_answer|
        scores_by_answer = scores_by_answer.select { |answer, score| @possible_answers.include?(answer) }
        @possible_scores[guess] = scores_by_answer
        score_groups = scores_by_answer.values.group_by(&:itself)
        possibility_counts = score_groups.values.map(&:length)
        worst_case_possibilities = possibility_counts.max
        impossible_guess = @possible_answers.include?(guess) ? 0 : 1
        [worst_case_possibilities, impossible_guess, guess]
      end
      puts "Guess: #{guesses.min.last}"
      guesses.min.last 
    else
      "1122"
    end
  end
end

game  = TutoAlgo.new
game.play

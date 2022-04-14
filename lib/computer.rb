require_relative 'mastermind'

class Computer < Mastermind

  def init 
    @feedback_logs = []
    @guess_logs = []
  end  

  def store_feedback(feedback)
    parsed = feedback.tr(':', '').split(' ')
    @feedback_logs.push({parsed[0] => parsed[1], parsed[2] => parsed[3]})
  end

  def user_feedback
    user_feedback = gets.chomp
    store_feedback(user_feedback)
  end

  def guessing_algorithm
    
  end
    
  def make_a_guess
    if "beginning of party" 
      @guess = COLORS.sample(4)
    else
      @guess = guessing_algorithm      
    end
  end

  def self.play
    make_a_guess 
    user_feedback
  end    
end

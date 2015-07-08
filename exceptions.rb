# exceptions handling for the 2-player math game

class InvalidGuessError < StandardError
  
  def message
    "Invalid Guess. Please enter an integer greater than 0."
  end

end

class InvalidNameError < StandardError
  
  def message
    "Invalid name."
  end

end
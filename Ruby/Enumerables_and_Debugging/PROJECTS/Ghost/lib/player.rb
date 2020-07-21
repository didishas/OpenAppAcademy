
class Player
  attr_accessor :guess
  attr_reader :name

  def initialize(name)
    @name = name
    @guess = ''
  end

  def alert_invalid_guess
    p "Invalid Guess letter : #{@guess}"  
  end
end


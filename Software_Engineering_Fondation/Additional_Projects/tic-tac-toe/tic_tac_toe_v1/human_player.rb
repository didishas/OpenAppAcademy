class HumanPlayer
  attr_reader :mark
  attr_accessor :active

  def initialize(mark_value)
    @active = false
    @mark = mark_value
  end

  def get_position
    p "Player X, enter two numbers representing a position in the format  `row col`"
    user_ans = gets.chomp

    if user_ans == '' 
      raise "Player X, enter coordinates" 
    else
      arr_pos = user_ans.split(" ")
      if arr_pos.length != 2
        raise "Player enter only 2 numbers"
      else
        if arr_pos.all? { |x| /[0-9]/.match(x) != nil} 
          return arr_pos.map(&:to_i)
        else
          raise "Please enter 2 numbers in format `4 6`"
        end
      end
    end
  end

end

class HumanPlayer
  attr_reader :mark
  attr_accessor :active

  def initialize(mark_value)
    @active = false
    @mark = mark_value
  end

  def get_position(legal_positions)

    begin

      p "Player #{@mark}, enter two numbers representing a position in the format  `row col`"
      user_ans = gets.chomp

      raise ArgumentError if user_ans == ''

      arr_pos = user_ans.split(" ")
      raise StandardError if arr_pos.length != 2
      raise RegexpError if arr_pos.one? { |x| /[0-9]/.match?(x) == false} 
      
      result = arr_pos.map(&:to_i)
      
      if legal_positions.include?(result)
        return result
      else
        raise StandardError
      end
    rescue ArgumentError
      p "Player #{@mark} should not let coordinates empty" 
      retry
    rescue RegexpError
      p "Player #{@mark} should enter only numbers"
      retry
    rescue StandardError
      p "#{result} is not a legal position" 
      retry
    end
  end 
  

end

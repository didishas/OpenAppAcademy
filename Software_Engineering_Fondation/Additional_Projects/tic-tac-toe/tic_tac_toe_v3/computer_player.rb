
class ComputerPlayer
  attr_reader :mark
  attr_accessor :active

  def initialize(mark_value)
    @active = false
    @mark = mark_value
  end

  def get_position(legal_positions)
    prng = Random.new
    num = prng.rand(legal_positions.length - 1)
    legal_positions[num]
  end 

end

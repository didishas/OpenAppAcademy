class Player

  def get_move
    p "enter a position with coordinates separated with a space like `4 7`"
    input = gets.chomp
    coord_s = input.split(' ')
    coord_i = coord_s.map {|val| val.to_i}
  end
end

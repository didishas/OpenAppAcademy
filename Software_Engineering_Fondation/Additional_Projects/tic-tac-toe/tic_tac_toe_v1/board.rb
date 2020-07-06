


class Board

  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def valid?(position)
    row, col = position
    if row < 0 || col < 0 || row > @grid.length - 1 || col > @grid.length - 1
      false
    else
      true
    end
  end

  def empty?(position)
    row, col = position
    @grid[row][col] == '_' ? true : false
  end

  def place_mark(position, mark)
    row, col = position
    if (!self.valid?(position) || !self.empty?(position))
      raise "Error ... "
    else
      @grid[row][col] = mark
    end
  end

  def print
    @grid.each do |row|
      $stdout.print "| "
      row.each.with_index do |ele,index|
        $stdout.print (index < (row.length-1) ? "#{ele} ": "#{ele}")
      end
      $stdout.print " |\n"
    end
  end


  def win_row?(mark)
    @grid.each do |row|
      return true if row.all?(mark)
    end
    return false
  end

  def win_col?(mark)
    grid_transposed = @grid.transpose

    grid_transposed.each do |row|
      return true if row.all?(mark)
    end
    return false
  end
  
  def win_diagonal?(mark)
    count = 0
    step = 0

    while step < @grid.length
      count += 1 if @grid[step][step] == mark 
      return true if count == @grid.length
      step += 1
    end

    row = 0
    col = @grid.length - 1
    count = 0

    while row < @grid.length
      count += 1 if @grid[row][col] == mark
      return true if count == @grid.length
      row += 1
      col -= 1
    end

    return false
  end

  def win?(mark)
    return true if ( self.win_diagonal?(mark) || self.win_col?(mark) || self.win_row?(mark))
    return false
  end

  def empty_positions?
   
    @grid.each do |row|
      row.each do |x|
        return true if x == '_'
      end
    end

    return false
  end

end

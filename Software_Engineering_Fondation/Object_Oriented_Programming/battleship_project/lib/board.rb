class Board
  def self.print_grid(grid)
    grid.each do |row|
      row.each.with_index do |ele,index|
        print (index < (row.length-1) ? "#{ele} ": "#{ele}\n")
      end
      print
    end
  end

  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {|row| Array.new(n, :N)}
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
    #@grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    ships = 0
    @grid.each do |row|
      ships += row.count(:S)
    end
    ships
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p 'you sunk my battleship!'
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    num_ships = @size * 0.25
    count = 0
    prng = Random.new

    while count < num_ships
      n = @grid.length
      row = prng.rand(0...n)
      col = prng.rand(0...n)
      pos = [row, col]

       if self[pos] == :N
          self[pos] = :S
          count += 1
       end
    end
  end

def hidden_ships_grid
  @grid.map do |row|
    row.map do |col|
      if col == :X
        :X
      else
        :N
      end
    end
  end
end

def cheat
  Board.print_grid(@grid)
end

def print
  Board.print_grid(hidden_ships_grid)
end

  # end of class
end

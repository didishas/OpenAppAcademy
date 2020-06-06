class Board
    # PART 1
    def initialize(n)
        @grid = Array.new(n){|ele| ele = Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        total = 0
        @grid.each do |row|
            total += row.count(:S)
        end
        total
    end
    # END PART 1

    # PART 2
    def attack(position)
        if self[position] == (:S)
            self[position] = :H
            puts "should print 'you sunk my battleship!'"
            return true
        end
        self[position] = :X
        false
    end

    def place_random_ships
        while count < @size * 0.25
            
        end
    end
    # END PART 2
end


    class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = self.rand
        @num_attempts = 0
        @game_over = false
    end

    def rand
        prng = Random.new
        prng.rand(@min..@max)
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num < @secret_num
            p "too small"
        elsif num > @secret_num
            p "too big"
        else
            p "you win"
            @game_over = true
        end
    end

    def ask_user
        p "enter a number"

        self.check_num(gets.chomp.to_i)
    end
end


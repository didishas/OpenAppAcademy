 require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)

    end

    def print_matches(guess_code)
        p @secret_code.num_exact_matches(guess_code)
        p @secret_code.num_near_matches(guess_code)
    end
    
    def ask_user_for_guess
        puts "Enter a code"
        guess_letter = gets.chomp
        self.print_matches(Code.from_string(guess_letter))
        
        @secret_code == guess_letter
    end

end

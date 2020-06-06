class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word    # @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    answer = @attempted_chars.include?(char)
    # if !answer
    #   @attempted_chars << char
    # end
    answer
  end
  
  def get_matching_indices(char)
    chars_found = []
    
    @secret_word.each_char.with_index do |letter, index|
      chars_found << index if letter == char
    end
    chars_found
  end
  
  def fill_indices(char, chars_found)
    chars_found.each do |index|
      @guess_word[index] = char
    end
  end
  
  def try_guess(char)
    indexes = self.get_matching_indices(char)
    self.fill_indices(char, indexes)
    
    @remaining_incorrect_guesses -= 1 if indexes.empty?
    
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end

  end

  def ask_user_for_guess
    p "Enter a char:"
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false

    
  end

end

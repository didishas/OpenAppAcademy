class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? {|peg| POSSIBLE_PEGS.include?(peg.upcase)}
  end

  def self.random(length_pegs)
    pegs_arrays = []
    pegs_keys = POSSIBLE_PEGS.keys
    
    length_pegs.times {pegs_arrays << pegs_keys[rand(pegs_keys.length)]} # We should chech Array.sample
    Code.new(pegs_arrays)
  end

  def self.from_string(pegs)
    letters = pegs.split("")
    Code.new(letters)
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs) 
      raise "Invalid pegs"
    end
  
    @pegs = pegs.map(&:upcase)
  end



  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    count = 0
    guess_code.pegs.each.with_index do |peg, index| 
      count += 1 if guess_code[index] == self[index] # same as @pegs[index]
    end
    count
  end

  def num_near_matches(guess_code)
    count = 0
    guess_code.pegs.each.with_index do |peg, index| 
      count += 1 if (@pegs.include?(peg) && guess_code.pegs[index] != self[index])
    end
    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
    # self.length == other_code.length && self.num_exact_matches(other_code) == self.length
  end
end



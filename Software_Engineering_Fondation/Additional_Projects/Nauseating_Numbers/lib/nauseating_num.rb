# Phase 1: No big deal.



def strange_sums(arr)
    count = 0
    
    (0...(arr.length)).each do |i|
      
        ((i+1)...arr.length).each do |o|
            count += 1 if arr[i] + arr[o] == 0
        end
        
    end
    count
end        # => :strange_sums

def pair_product(numbers, product)
  
    (0...(numbers.length)).each do |i|
      
        ((i+1)...numbers.length).each do |o|
            return true if numbers[i] * numbers[o] == product
        end
        
    end
    false
end        # => :pair_product

def rampant_repeats(str, hash)
    new_str = ""
    
    (0...str.length).each do |i|
        if hash.has_key?(str[i])
            new_str += str[i] * hash[str[i]]
        else
            new_str += str[i]
        end
    end
    
    new_str
end          # => :rampant_repeats

def perfect_square(number)
    return true if number == 1 
    
    (0...number).each do |ele|
        return true if ele * ele == number
    end
    
    false
end        # => :perfect_square

# Phase 2: Nothing you can't handle.


def anti_prime?(number)
    hash = Hash.new(0)
    
    (1..number).each do |ele|
      
        (1..ele).each do |factor|
            if ele % factor == 0
                hash[ele] += 1
            end
        end
        
    end
    
    result = hash.sort_by {|k, v| v}
    result[-1][0] == number
end                                   # => :anti_prime?


def matrix_addition(a, b)
    operands = [a, b]
    return nil if a.length != b.length
    

    result = Array.new(a.length) {|x| Array.new}
    
    (0...a.length).each do |row|
      
        (0...a[0].length).each do |column|
            result[row][column] = a[row][column] + b[row][column]
        end
        
    end
    
    result
end         # => :matrix_addition

def mutual_factors(*numbers)
    arr = []
    
    (1..numbers[0]).each do |factor|
        if numbers[0] % factor == 0
            arr << factor if numbers.all? {|ele| ele % factor == 0}
        end
    end
    
    arr
end      # => :mutual_factors

def tribonacci_number(number)
    return 1 if number == 1 || number == 2
    return 2 if number == 3

    tribonacci_number(number-1) + tribonacci_number(number-2) + tribonacci_number(number-3)
end                                                                                          # => :tribonacci_number


# Phase 3: Now we're having fun.


def matrix_addition_reloaded(*a)
    a.inject {|result, matrix| matrix_addition(result, matrix)}
end                                                              # => :matrix_addition_reloaded


def squarocol?(arr)
    length = arr.length
    p arr

    arr.each do |row|
        # debugger
        modele_row = row[0]
        count_row = 0
        row.each do |column| #checking entire row line
            if column != modele_row
                break
            else
                count_row += 1
                return true if count_row == length
            end
        end
    end

    (0...arr.length).each do |column|
        count_column = 0
        
        (0...arr.length).each do |row|
            modele_column = arr[0][column]
            if arr[row][column] != modele_column
                break
            else
                count_column += 1
                return true if count_column == length
            end
        end
        
    end
    
    false
end        # => :squarocol?

#p squarocol?([
#    [:a, :x , :d],  # => [:a, :x, :d]
#    [:b, :x , :e],  # => [:b, :x, :e]
#    [:c, :x , :f],  # => [:c, :x, :f]
#])                  # => true

#p squarocol?([
#    [:x, :y, :x],  # => [:x, :y, :x]
#    [:x, :z, :x],  # => [:x, :z, :x]
#    [:o, :o, :o],  # => [:o, :o, :o]
#])                 # => true

#p squarocol?([
#    [:o, :x , :o],  # => [:o, :x, :o]
#    [:x, :o , :x],  # => [:x, :o, :x]
#    [:o, :x , :o],  # => [:o, :x, :o]
#])                  # => false

#p squarocol?([
#    [1, 2, 2, 7],  # => [1, 2, 2, 7]
#    [1, 6, 6, 7],  # => [1, 6, 6, 7]
#    [0, 5, 2, 7],  # => [0, 5, 2, 7]
#    [4, 2, 9, 7],  # => [4, 2, 9, 7]
#])                 # => true

#p squarocol?([
#    [1, 2, 2, 7],  # => [1, 2, 2, 7]
#    [1, 6, 6, 0],  # => [1, 6, 6, 0]
#    [0, 5, 2, 7],  # => [0, 5, 2, 7]
#    [4, 2, 9, 7],  # => [4, 2, 9, 7]
#])                 # => false


def squaragonal?(arr)
    length = arr.length
    modele_top_left = arr[0][0]
    modele_top_right = arr[0][-1]
    count = 0

    (0...length).each do |index|
      
        if arr[index][index] == modele_top_left 
            count += 1
            return true if count == length
        end
        
    end
    
    count = 0
    
    (0...length).each do |index|
        if arr[index][(length - 1) - index] == modele_top_right
            count += 1
            return true if count == length
        end
    end
    
    false
end        # => :squaragonal?

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# Helpers for pascals_triangle
# PASCAL TRIANGLE
def seq(arr)
    result = [1]
    length = arr.length

    (0...length).each do |i|
        if arr[i+1] == nil
            result << arr[0]
        else
            result << arr[i] + arr[i+1]
        end
    end
    
    result

end  # => :seq


def superseq(n)
    return seq([]) if n == 1
    seq(superseq(n-1))
end                           # => :superseq

def pascals_triangle(n)
    arr = Array.new(n) {|x| Array.new}

    arr.each.with_index do |ele, i|
        ele.concat(superseq(i+1))
    end
    
end  # => :pascals_triangle

# p pascals_triangle(7)

# PHASE 4 NAUSEATING

def is_prime?(n)
    return false if n == 0 || n == 1  # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
    
    (2...n).each do |factor|             # => 2...13, 2...14, 2...15, 2...16, 2...17, 2...18, 2...19, 2...16, 2...17, 2...18, 2...19, 2...20, 2...21, 2...22, 2...23, 2...8, 2...9, 2...10, 2...11, 2...12, 2...13, 2...14, 2...15, 2...16, 2...17, 2...20, 2...19, 2...10, 2...9, 2...8, 2...7
        return false if n % factor == 0  # => false, false, false, false, false, false, false, false, false, false, false, true, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, fa...
    end                                  # => 2...13, 2...17, 2...19, 2...17, 2...19, 2...23, 2...11, 2...13, 2...17, 2...19, 2...7
    
    true  # => true, true, true, true, true, true, true, true, true, true, true
end       # => :is_prime?


def mersenne_prime(n)
    count = 0
    number = 0
    mersenne_number = 0
    
    while count != n
        number += 1
        mersenne_number = 2**number - 1
        count += 1 if is_prime?(mersenne_number)
    end
    
    mersenne_number
end                  # => :mersenne_prime

# p mersenne_prime(4)

def triangular_number?(num)
  
    (0...num).each do |n|
        return true if (n * (n + 1)) / 2 == num
    end
    
    false
end        # => :triangular_number?

# p triangular_number?(3)

def triangular_word?(word)
    alphabet = ('a'..'z').to_a

    sum = 0
    
    word.each_char do |letter|
        sum += alphabet.index(letter) + 1
    end
    
    p word
    triangular_number?(sum)
    
end  # => :triangular_word?

# p triangular_word?('abc') 
# p triangular_word?('ba')    
# p triangular_word?('lovely') 
# p triangular_word?('question')
# p triangular_word?('aa')  
# p triangular_word?('cd')   
# p triangular_word?('cat')   
# p triangular_word?('sink')   

def consecutive_collapse(array)
  collapsed = false           

  while !collapsed                         
    collapsed = true                    
    
    (0...(array.length - 1)).each do |i| 
      cur = array[i]                  
      nex = array[i + 1]             
      if cur != nil && nex != nil   

        if array[i] == array[i+1] + 1    
          collapsed = false             
          array.slice!(i,1)              
          array.slice!(array.index(nex),1)
          break
        elsif array[i] == array[i + 1] - 1
          collapsed = false            
          array.slice!(i,1)           
          array.slice!(array.index(nex),1)
          break
        end
      end
    end 
    
  end    
  
  array 
end      # => :consecutive_collapse

# p consecutive_collapse([3, 4, 1])     # => [1]
# p consecutive_collapse([1, 4, 3, 7])  # => [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def nth_prime(ref, n)
	count = 0             # => 0, 0, 0, 0, 0, 0
  
 if n > 0                       # => true, true, true, false, false, false
	while count < n                # => true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, true, true, false
		ref += 1                      # => 13, 14,  15,  16,  17, 18,  19, 16,  17, 18,  19, 20,  21,  22,  23, 8,   9,   10,  11, 12,  13, 14,  15,  16,  17
		count += 1 if is_prime?(ref)  # => 1,  nil, nil, nil, 2,  nil, 3,  nil, 1,  nil, 2,  nil, nil, nil, 3,  nil, nil, nil, 1,  nil, 2,  nil, nil, nil, 3
	end                            # => nil, nil, nil
 end                            # => nil, nil, nil, nil, nil, nil

 if n < 0            # => false, false, false, true, true, true
   while count != n  # => true, true, true, false, true, true, true, true, false
     ref -= 1        # => 1, 20, 19, 10, 9, 8, 7

     return nil if ref < 2         # => true, false, false, false, false, false, false
     count -= 1 if is_prime?(ref)  # => nil, -1, nil, nil, nil, -1
     
   end  # => nil, nil

 end  # => nil, nil, nil, nil, nil
	ref  # => 19,  23,  17,  19,  7
end   # => :nth_prime


def pretentious_primes(arr, n)
  arr.each.with_index do |value, index|
    if nth_prime(value, n) 
      arr[index] = nth_prime(value, n)
    else
      arr[index] = nil
    end
	end
  arr
end                                      # => :pretentious_primes



p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

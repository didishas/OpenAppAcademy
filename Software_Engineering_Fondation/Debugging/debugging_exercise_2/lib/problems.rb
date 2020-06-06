# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    largest_factor = 0

    (2..num).each do |factor|
        # debugger
        largest_factor = factor if ((num % factor == 0) && is_prime?(factor) )
    end
    largest_factor
end

# Helper for largest_prime_factor
def is_prime?(num)

    (2...num).each do |factor|
        return false if num % factor == 0
    end
    num > 1
end

def unique_chars?(string)
    
    string.each_char do |char|
        count = string.count(char)
        return false if count > 1
    end
    true
end

def dupe_indices(array)
    hash = Hash.new([])

    array.each.with_index do |ele, index|
        if array.count(ele) > 1
            if hash.has_key?(ele)
                hash[ele] << index
            else 
                hash[ele] = [index]
            end
        end
    end
    hash    
end

def ana_array(array_1, array_2)
    return false if array_1.length != array_2.length

    array_1.each do |ele|
        return false if !(array_2.include?(ele)) || (array_1.count(ele) != array_2.count(ele))
    end
    true
end

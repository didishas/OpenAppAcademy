
# Part 2

def proper_factors(number)
    arr = []
    (1...number).each {|factor| arr << factor if number % factor == 0}
    arr
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(number)
    return aliquot_sum(number) == number ? true: false
end

def ideal_numbers(n)
    count = 0
    number = 0
    arr = []

    while count < n
        number += 1
        if perfect_number?(number)
            count += 1 
            arr << number
        end
    end
    arr
end

p ideal_numbers(2)
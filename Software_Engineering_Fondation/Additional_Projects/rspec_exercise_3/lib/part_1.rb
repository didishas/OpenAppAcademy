# Part 1

# is_prime

def is_prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        return false if num % factor == 0 
    end
    true
end


def nth_prime(n)
    count = 0
    number = 0

    while count < n
        number += 1
        count += 1 if is_prime?(number)
    end
    return number
end

def prime_range(min, max)
    (min..max).select{|num| is_prime?(num)}
end
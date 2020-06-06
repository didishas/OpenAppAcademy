# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    
    # find the divisor of num_1 and store in arr
    arr = []
    num_1.downto(2) do |divisor|
        arr << divisor if num_1 % divisor == 0
    end

    # check if one of divisor the can divide num_2
    return arr.none? {|divisor| num_2 % divisor == 0}
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

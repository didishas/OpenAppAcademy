# average
# should accept two numbers as arguments
# Shoud return the average of the two numbers

def average(num_1, num_2)
    if !(num_1.instance_of?(Integer) && num_2.instance_of?(Integer))
        raise "arguments must be numbers"
    end
    (num_1 + num_2) / 2.0
end

# average_array 
# should accept an array of numbers as an arg
# should return the average of the numbers of the array

def average_array(array)
    array.each do |ele|
        raise "All member must be numbers" if !(ele.instance_of?(Integer))
    end

    array.sum / array.length.to_f
end

# repeat
# should accept a string and a number as args
# should return a new string where the original is repeated that number of times

def repeat(string, number)
    if !(string.instance_of?(String))
        raise "first argument should be a String"
    end
    if !(number.instance_of?(Integer))
        raise "second argument should be a Integer"
    end
    string*number
end

#Yell
# should accept a string as an arg
# should return a yelled version of the string
def yell(string)
    if !(string.instance_of?(String))
        raise "The argument should be a String"
    end
    string.upcase! << "!"
end

#Alternating_case
# should accept a sentence strig as an arg
# should return the sentence with words alternating between uppercase and lowercase

def alternating_case(string)
    if !(string.instance_of?(String))
        raise "The argument should be a String"
    end

    words = string.split(" ")

    words.each_with_index do |word, index| 
        index % 2 == 0 ? word.upcase! : word.downcase!
    end

    words.join(" ")
end
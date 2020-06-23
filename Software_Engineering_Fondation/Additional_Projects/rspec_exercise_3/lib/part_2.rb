require 'pry'

# Part 2

def element_count(arr)
    if !(arr.instance_of?(Array))
        raise "arguments must be array"
    end

    hash = Hash.new(0)
    arr.each { |key| hash[key] += 1}
    hash

end

def char_replace!(str, hash)
    str.each_char do |char|
        if hash[char]
            str[char] = hash[char]
        end
    end
end

def product_inject(arr)
    arr.inject(&:*)
end
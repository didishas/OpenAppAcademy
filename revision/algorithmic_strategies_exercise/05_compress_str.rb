# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    count = 1
    letters = str.split('')
    result = ''
    
    (1..letters.length).each do |index|

        if letters[index] == letters[index - 1]
            count += 1
        else
            result << (count > 1 ? "#{count}#{letters[index - 1]}": "#{letters[index - 1]}")
            count = 1
        end
    end
    result
    
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"

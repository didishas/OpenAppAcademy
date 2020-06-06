# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    previous_char = ""
    result = ""
    count = 0
    str.each_char do |char|
        if previous_char == char
            count += 1
        else
            if previous_char != ""
                result << count.to_s if count > 1
                result << previous_char
            end
            previous_char = char
            count = 1
        end
    end
    result << count.to_s if count > 1
    result << previous_char
    result
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"

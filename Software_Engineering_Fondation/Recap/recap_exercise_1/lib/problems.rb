# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    result = []

    (0...words.length).each do |first_index|
        (first_index...words.length).each do |second_index|
            vowels = "aeiou"
            word_1 = words[first_index]
            word_2 = words[second_index]

            vowels.each_char do |char|
                vowels.slice!(char) if word_1.include?(char) || word_2.include?(char)
                result << "#{word_1} #{word_2}" if vowels == ""
            end
        end
    end
    result
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |factor|
        return true if num % factor == 0
    end
    false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    result = []
    bigrams.each do |bigram|
        result << bigram if str.include?(bigram)
    end
    result

    # 2nd Method
    # bigrams.select {|bigram| str.include?(bigram)}
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select 
                               # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new {|k,v| k == v}
        hash = {}

        self.each do |k,v|
            hash[k] = v if prc.call(k,v)
        end
        hash
    end
end


class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        arr = []

        (0...self.length).each do |outdex|
            (outdex...self.length).each do |index|
                # 1st Method : iterate and select subs with required length if given
                if length == nil
                    arr << self[outdex..index]
                else
                    arr << self[outdex..index] if self[outdex..index].length == length
                end
            end
        end
        # 2nd Method : iterate first than select only subs with required length BUT too much operation
        # if length == nil
        #     return arr
        # else
        #     return arr.select {|subs| subs.length == length} 
        # end
        arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        str = ""
        self.each_char do |char|
            if (char.ord + 1) > 122
                str += (((char.ord + num) % 122) + 96).chr 
            else
                str += ((char.ord + num) % 122).chr
            end
        end
        str
    end

end
p (("p".ord + 1) % 122).chr
p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
p "apple".caesar_cipher(1)    #=> "bqqmf"
p "zebra".caesar_cipher(4)    #=> "difve"

#Partition
# Should accept an array and a number as args
# Should return a 2D array of length 2 where the first subarray contains elements less than 
#the number arg and the second subarray contains elements than or equal to the number arg
def partition(arr, number)
    new_arr = Array.new(2) {Array.new()}

    arr.each do |ele|
        ele < number ? new_arr[0] << ele : new_arr[1] << ele
    end
    new_arr
end

#Merge
# Should accept two hashes as 
# Should return a new hash representing containing key-value from both hashes
# Should take the value from the secon hsh if the two hashes have duplicate keys
# Should not mutate the two input hashes
def merge(hash_1, hash_2)
    new_hash = Hash.new()

    hash_1.each {|key, value| new_hash[key] = value}

    hash_2.each {|key, value| new_hash[key] = value}
    new_hash
end

#Censor
# Should accept a sentence and an array of curse words as args
# Should return the sentence where every curse word has it's vowels replaced with "*"
def censor(sentence, curse_array)
    words = sentence.split(" ")

    words.each.with_index do |word, w_index|
        if curse_array.include?(word.downcase) 
            vowels = "aeiou"
            
            word.each_char.with_index do |letter, l_index|
                word[l_index] = "*" if vowels.include?(letter.downcase) 
            end
            
        end
    end
    words.join(" ")
end

#Power_of_two
# Should accept a number as an arg
# When the number is a power of two return true
# When the number is not power of two return false
def power_of_two?(number)
    quotient = number
    while quotient != 1
        if quotient % 2 == 0
            quotient /= 2
        else
            return false
        end
    end
    true
end


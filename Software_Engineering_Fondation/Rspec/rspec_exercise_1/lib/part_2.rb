#Hipsterfy
# should accept a word as an arg
# should return the word with it's last vowel
# should return the original word if it contains no vowels

def hipsterfy(word)
    if !(word.instance_of?(String))
        raise "The argument should be a String"
    end
    
    vowels = "aeiuo"
    last_vowel = ""
    last_index = 0
    
    word.each_char.with_index do |char, index|
        if vowels.include?(char)
            last_vowel = char
            last_index = index
        end
    end
    
    last_vowel == "" ? word : word.slice!(last_index)
    word
end

#Vowel_counts
# should accept string ans an arg
# should return a hash where each key is a vowel of string and it's value is the number os times it appears

def vowel_counts(string)
    if !(string.instance_of?(String))
        raise "The argument should be a String"
    end

    vowels = "aeiuo"
    hash = Hash.new(0)

    string.each_char do |char|
        if vowels.include?(char.downcase)
            hash[char.downcase] += 1
        end
    end
    hash    
end

#Caesar_cipher
# should accept a message and a number 
# should return a new string where every letter of the message is shifted n positions in the alphabet
# should not modify non-alphabetic characters

def caesar_cipher(message, number)
    if !(message.instance_of?(String))
        raise "first argument should be a String"
    end
    if !(number.instance_of?(Integer))
        raise "second argument should be a Integer"
    end

    phrase = String.new()

    message.each_char do |letter|
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        phrase << (alphabet.include?(letter) ? alphabet[(alphabet.index(letter) + number) % 26] : letter)
    end
    phrase
end
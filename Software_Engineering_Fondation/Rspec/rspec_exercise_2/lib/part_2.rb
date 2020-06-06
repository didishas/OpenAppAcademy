#Palindrome? 
# Should accept a string as an arg
# Should not use String.reverse
# When The string is the same forwards and backwards should return true
# When the string is not the same forwards and backwards should return false

def palindrome? (word)
    letters = word.split("")
    new_word = String.new("")

    (letters.length - 1).downto(0) do |i|
        new_word << letters[i]
    end
    word == new_word
end

#Substrings
# Should accept a string as an arg
# Should return an array containing all substrings of the given string

def substrings(string)
    letters = string.split("")
    substring = []
    
    while letters.length > 0
        i =  0
        while i < letters.length
            new_letters = []
            j = 0
            while j <= i
                new_letters << letters[j]
                j += 1
            end
            substring << new_letters.join("")
            i += 1
        end
        letters.shift
    end
    substring
end


#palindrome_substrings
# Should accept a string as an arg 
# Should return an array containing all substrings that are palindromes and longer than 1
# Should call your previous "palindrome?" method
# Should call your previous "substrings" method

def palindrome_substrings(string)
    substrings = substrings(string)
    palindrome_subs_arr = []

    substrings.each do |word|
        if palindrome?(word) && word.length > 1
            palindrome_subs_arr << word if palindrome_subs_arr.index(word) == nil
        end
    end
    palindrome_subs_arr
end


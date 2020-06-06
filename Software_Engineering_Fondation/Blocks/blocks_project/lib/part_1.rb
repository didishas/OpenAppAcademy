def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(hash)
    hash.reject {|ele| ele["age"] <= 2}
end

def count_positive_subarrays(array)
    array.count {|subarray|  subarray.sum > 0 }
end

def aba_translate(string)
    vowels = "aeiuo"
    new_word = ""

    string.each_char.with_index do |char, index|
        if vowels.include?(char)
            new_word << char << "b" << char
        else
            new_word << char
        end
    end
    new_word
end

def aba_array(array)
    array.map { |word| aba_translate(word)}
end

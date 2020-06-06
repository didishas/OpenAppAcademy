def select_even_nums(arr)
    arr.select(&:even?)
end


def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count {|pos| pos.sum > 0}
end

def aba_translate(str)
    letters = str.split('')
    vowels = 'aeiou'
    result = ''

    (0...letters.length).each do |i|
        result << letters[i]
        if vowels.include?(letters[i])
            result << "b#{letters[i]}"
        end
    end
    result
end


def aba_array(arr)
    arr.map { |word| aba_translate(word)}
end

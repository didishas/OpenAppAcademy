require "pry"
require "byebug"

def zip(*arrays)
    result = Array.new(arrays[0].length) {|array| array =  Array.new}
    arrays.each do |array|
        (0...array.length).each do |i|
            # binding.pry
            # debugger
            result[i] << array[i]
        end
    end
    result
end

def prizz_proc(array, *arg_prc)
    result = []
    array.each do |ele|
        result << ele if ((arg_prc[0].call(ele) && !arg_prc[1].call(ele)) || (!arg_prc[0].call(ele) && arg_prc[1].call(ele)))
    end
    result
end

def zany_zip(*arrays)
    max_length = 0
    arrays.each do |array|
        max_length = array.length if array.length > max_length
    end

    result = Array.new(max_length) {|array| array =  Array.new}
    arrays.each do |array|
        (0...max_length).each do |i|
            # byebug
            if  array[i] 
                result[i] << array[i] 
            else
                result[i] += [nil]
            end
        end
    end
    result
end

def maximum(array, &prc)
    max = 0
    max_ele = nil
    return nil if array.length == 0

    array.each do |ele|
        if yield(ele) >= max
            max = yield(ele)
            max_ele = ele
        end
    end
    max_ele
end

def my_group_by(array, &prc)
    hash = Hash.new{ |k, v| v = Array.new}

    array.each do |value|
        hash[yield(value)] += [value]
    end

    hash
end

def max_tie_breaker(array, prc, &block)
    arr_tie = []
    array.each do |ele|
        arr_tie << ele if block.call(maximum(array, &block)) == block.call(ele)
    end 
    # maximum(array, &block)
    # p arr_tie
    p maximum(arr_tie, prc) if arr_tie.length > 2
    arr_tie[0]
end

array_1 =  ['potato', 'swimming', 'cat'] 
array_2 =  ['cat', 'bootcamp', 'swimming', 'ooooo'] 
array_3 =  ['photo','bottle', 'bother'] 
length = Proc.new { |s| s.length } 
o_count =  Proc.new { |s| s.count('o') } 

# max_tie_breaker(array_1, o_count, &length)
def vowel_sub(word)
    vowels = "aeiou"
    first = 0
    last = 0
    (0...word.length).each do |i|
        if vowels.include?(word[i])
            first = i
            break
        end
    end
    (0...word.length).each do |i|
        if vowels.include?(word[i])
            last = i
        end
    end
    if last != first
        word = word[first..last]
    else
        word
    end
end

def silly_syllables(sentence)
    words = sentence.split(' ')

    new_words = words.map! do |ele|
        vowel_sub(ele)
    end
    new_words.join(" ")
end




def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    words = string.split(" ")
    new_words = []
    words.each {|word| new_words << prc.call(word)}
    new_words.join(" ")
end

def greater_proc_value(number, prc_1, prc_2)
    value_1 = prc_1.call(number)
    value_2 = prc_2.call(number)
    value_1 > value_2 ? value_1 : value_2
end

def and_selector(array, prc_1, prc_2)
    new_array = []

    array.each do |ele|
        new_array << ele if (prc_1.call(ele) && prc_2.call(ele))
    end
    new_array    
end

def alternating_mapper(array, prc_1, prc_2)
    new_array = []
    array.each_with_index do |ele, index|
        if index.even? 
            new_array << prc_1.call(ele) 
        else
            new_array << prc_2.call(ele)
        end
    end
    new_array
end
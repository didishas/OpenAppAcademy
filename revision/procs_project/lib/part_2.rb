def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    words.map!{|word| prc.call(word)}
    words.join(' ')
end

def greater_proc_value(num, prc_1, prc_2)
    prc_1.call(num) > prc_2.call(num) ? prc_1.call(num) : prc_2.call(num)
end 

def and_selector(arr, prc_1, prc_2)
    arr.select {|num| prc_1.call(num) && prc_2.call(num)} 
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.map.with_index do |elt, index|
        if index % 2 == 0
            prc_1.call(elt)
        else
            prc_2.call(elt)
        end
    end
end


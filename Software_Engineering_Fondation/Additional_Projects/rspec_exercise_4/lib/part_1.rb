

# Part 1

def my_reject(arr, &prc)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if !yield(ele)
    end
    new_arr
end

def my_one?(arr, &prc)
    count = 0

    arr.each do |ele|

        count += 1 if yield(ele)
        return false if count > 1
    end
    return false if count < 1
    true
end

def hash_select(hash, &prc)
    result = {}
    hash.each do |k, v|
        result[k] = v if yield(k, v)
    end
    result
end

def xor_select(arr, *arg)
    new_arr = []

    arr.each do |ele|
        new_arr << ele if ((!arg[0].call(ele) && arg[1].call(ele)) || (arg[0].call(ele) && !arg[1].call(ele)))
    end
    new_arr
end

def proc_count(value, arr)
    count = 0

    arr.each do |prc|
        count += 1 if prc.call(value)
    end
    count
end

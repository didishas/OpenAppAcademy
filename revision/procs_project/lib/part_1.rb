def my_map(arr, &prc)
    result = []
    arr.each do |elt|
        result << prc.call(elt)
    end
    result
end

def my_select(arr, &prc)
    result = []

    arr.each do |elt|
        result << elt if prc.call(elt)
    end
    result
end

def my_count(arr, &prc)
    count = 0

    arr.each do |elt|
        count += 1 if prc.call(elt)
    end
    count
end

def my_count(arr, &prc)
    count = 0
    
    arr.each do |elt|
        count += 1 if prc.call(elt)
    end
    count
end

def my_any?(arr, &prc)
    count = 0

    arr.each do |elt|
        return true if prc.call(elt)
    end
    return false
end

def my_all?(arr, &prc)
    count = 0

    arr.each do |elt|
        return false if !prc.call(elt)
    end
    return true
end

def my_none?(arr, &prc)
    count = 0

    arr.each do |elt|
        return false if prc.call(elt)
    end
    return true
end


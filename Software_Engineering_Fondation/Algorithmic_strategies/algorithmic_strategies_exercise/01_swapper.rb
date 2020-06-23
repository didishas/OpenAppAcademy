# Write a method, swapper(arr, idx_1, idx_2), that accepts an array and two indices as args.
# The method should swap the elements at the given indices and return the array.
# The method should modify the existing array and not create a new array.
def swapper(arr, num1, num2)
    arr[num1], arr[num2] = arr[num2], arr[num1]  # => ["c", "a"],           ["b", "d"],           ["canal", "broadway"]
    arr                                          # => ["c", "b", "a", "d"], ["a", "d", "c", "b"], ["broadway", "canal", "madison"]
end                                              # => :swapper

p swapper(["a", "b", "c", "d"], 0, 2)              # => ["c", "b", "a", "d"]
p swapper(["a", "b", "c", "d"], 3, 1)              # => ["a", "d", "c", "b"]
p swapper(["canal", "broadway", "madison"], 1, 0)  # => ["broadway", "canal", "madison"]

# >> "This is the begin of the program"
# >> ["c", "b", "a", "d"]
# >> ["a", "d", "c", "b"]
# >> ["broadway", "canal", "madison"]

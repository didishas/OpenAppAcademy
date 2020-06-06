# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
    # PART 1
    def span
        return nil if self.empty?

        min = self.min
        max = self.max
        max - min
    end
    
    def average
        return nil if self.empty?
        
        self.sum * 1.0 / self.length
    end

    def median
        # debugger
        return nil if self.empty?

        sorted = self.sort
        length = self.length
        indexes = length - 1
        
        left_element = sorted[indexes / 2] 
        right_element = sorted[indexes / 2 + 1] 

        return left_element if length.odd?
        (left_element + right_element) * 1.0 / 2
    end

    def counts
        count = Hash.new(0)

        self.each { |ele| count[ele] += 1}
        count
    end

    # PART 2
    def my_count(arg)
        count = 0
        self.each {|ele| count +=1 if ele == arg}
        count
    end

    def my_index(arg)
        index = 0
        self.each do |ele|
            return index if ele == arg
            index += 1
        end
        nil
    end

    def my_uniq
        uniq = []

        self.each do |ele|
            uniq << ele if !(uniq.include?(ele))
        end
        uniq
    end

    def my_transpose
        transpose = Array.new(self.length) {Array.new}
        
        self.each_with_index do |row, row_index|
            row.each_with_index do |column, column_index|
                transpose[column_index] << column
            end
        end
        transpose
    end
end

arr_1 = [
    ["a", "b", "c"],
    ["d", "e", "f"],
    ["g", "h", "i"]
  ]

p  arr_1.my_transpose
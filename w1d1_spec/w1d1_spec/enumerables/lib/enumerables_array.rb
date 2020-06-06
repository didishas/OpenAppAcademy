require "pry"
require "pry-doc"



class Array

    #ENUMERABLES
    
    def my_each(&prc)

        for i in (0...self.length) do
            prc.call(self[i])
        end
        self
    end
    
    def my_select(&prc)
        arr = []
        
        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        
        self.my_each do |ele|
            arr << ele unless prc.call(ele)
        end
        arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false unless prc.call(ele)
        end
        true
    end
    
    
    #ARRAYS
    
    def my_flatten
        arr = []
        # binding.pry
        self.my_each do |ele|
            if ele.class != Array
                arr << ele
            else
                arr += ele.my_flatten
            end
        end
        arr
    end

    def my_zip(*args) 
        arr = []
        (0...self.length).each do |i|
            arr[i] = []
            arr[i].<< self[i]
            args.each do |arg|
                arr[i] << arg[i]
            end
        end
        p arr
    end

    def my_rotate(num = 1)
        temp = [*self]

        while num != 0
            if num > 0
                # p num
                temp = temp[1..-1] + temp[0..0]
                num -= 1
            elsif num < 0
                temp = temp[-1..-1] + temp[0..-2]
                num += 1
            else
                temp 
            end
        end
        # p "original : #{self}"
        temp
    end

    def my_join(str = '')
        result = ""
        (0...self.length).each do |i|
            result += (i < self.length - 1) ? self[i] + str : self[i]
        end
        p result
    end

    def my_reverse
        return self if self.length == 1
        
        sequence = [self.slice!(-1)] + self.my_reverse
        sequence
    end

    def bubble_sort!(&prc)
        sorted = false

        while !sorted
            prc ||= Proc.new {|a, b| a <=> b}
            sorted = true

            (0...(self.length - 1)).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    sorted = false
                    self[i], self[i+1] = self[i+1], self[i]
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        temp = [*self]
        sorted = false

        temp.bubble_sort!
    end


    def my_map(&prc)
        arr = []

        self.each do |ele|
            arr << prc.call(ele)
        end
        arr
    end

    def my_inject(*args)
        if args.length > 0
            accu = args[0]
            self.my_each do |ele|
                accu =  yield(accu, ele)
            end
        else
            accu = self[0]
            self[1..-1].my_each do |ele|
                accu =  yield(accu, ele)
            end
        end
        accu
    end
end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

def factors(num)
    (1..num).select{ |factor| num % factor == 0}
end

def subwords(str, arr)
    arr.select {|word| str.include?(word)}
end

def doubler(arr)
    arr.map {|x| x * 2}
end
p [5, 2, 3, 4, 1].bubble_sort!

def concatenate(strings)
    strings.inject {|accu, word| accu + word}
end



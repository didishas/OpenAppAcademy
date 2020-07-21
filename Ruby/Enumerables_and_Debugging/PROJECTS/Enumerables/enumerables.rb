
class Array

    #ENUMERABLES
    
    def my_each(&prc)

        for i in (0...self.length) do
          # prc.call(self[i])
            yield(self[i])
        end
        self
    end
    
    def my_select(&prc)
        arr = []
        
        self.my_each do |ele|
            # arr << ele if prc.call(ele)
            arr << ele if yield(ele)
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
end


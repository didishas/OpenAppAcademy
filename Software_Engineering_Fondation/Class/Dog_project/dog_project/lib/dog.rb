class Dog
    def initialize(name, breed, age, bark, favorite_food)
        @name = String.new(name)
        @breed = String.new(breed)
        @age = age
        @bark = String.new(bark)
        @favorite_foods = Array.new(favorite_food)
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(age)
        @age = age
    end

    def bark
        if @age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(food)
        @favorite_foods.each do |fav_food|
            if fav_food.downcase == food.downcase
                return true
            end
        end
        false
    end

end
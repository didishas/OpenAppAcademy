require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}

        rooms.each do |name, room|
            @rooms[name] = Room.new(room)
        end
    end

    def name
        words = @name.split(' ')

        words.map(&:capitalize).join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(guest, room_name)
        
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(guest)
                puts "check in successful"
            end
            puts "sorry, room is full"
        else 
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any? { |name, room| !room.full?}
    end

    def list_rooms
        @rooms.each do |name, room|
            puts "#{name} #{room.available_space}"
        end
    end

end

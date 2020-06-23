
class Ghost

    def self.populate_dictionary
        hash = Hash.new
        data = File.open("./Ghost/lib/dictionary.txt")

        data.each_line do |line| 
            hash[line.chomp] = 1
        end
        data.close
        hash
    end

    def initialize(*players)
        @players = players
        @fragment = Array.new
        @dictionary = Ghost.populate_dictionary
    end

    def play_round
        

    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[1]
    end

    def next_player!
        @players.rotate!
    end
end
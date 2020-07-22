require 'byebug'
require_relative 'player.rb'

class Ghost

  attr_reader :fragment, :dictionary, :players

    def self.populate_dictionary
        hash = Hash.new
        data = File.open("./dictionary.txt")

        data.each_line do |line| 
          hash[line.chomp.to_sym] = 1
        end
        data.close
        hash
    end

    def initialize(*players)
        @players = []
        players.each {|player| @players << Player.new(player)}
        @fragment = '' 
        @dictionary = Ghost.populate_dictionary
        
        @losses = Hash.new 
        @players.each do |player, value|
          @losses[player.name] = 0
        end
    end

    def reinit(fragment)
      @players.each do |player, value|
        @losses[player.name] = 0
      end
      @fragment = ''
    end

    def play_round
        while !@dictionary.has_key?(@fragment.to_sym)
          take_turn(current_player)
          next_player!
        end
        losses(previous_player.name)

        p "Player #{previous_player.name} lost he found #{@fragment}"
        p "Player #{previous_player.name} is close to #{record(@losses[previous_player.name])}"

        last_fragment = @fragment
        @fragment = ""
        last_fragment
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players.rotate!
    end

    def ask_letter_to_add(player)
      p "Player #{player.name} enter a letter: "
      guess_letter = gets.chomp
      guess_letter
    end

    def is_valid_fragment?(string)
      @dictionary.each do |key, value|
        return true if key.to_s[0...string.length] == string
      end
      false
    end

    def valid_play?(string)
      alphabet = ("a".."z").to_a + ("A".."Z").to_a
      test = @fragment + string

      alphabet.include?(string) && is_valid_fragment?(test)
    end

    def take_turn(player)
      player.guess = ask_letter_to_add(player)
      
      while !valid_play?(player.guess)
        player.alert_invalid_guess
        player.guess = ask_letter_to_add(player)
        
      end
      @fragment += player.guess
    end


    def losses(player)
      @losses[player] += 1
    end

    def record(losses)
      ghost = "GHOST"
      ghost.slice(0...losses)
    end

    def eliminate_player
      self.players.pop
    end

    def run
      while @players.length > 1
        last_fragment = ''
        reinit(@fragment)

        while record(@losses[previous_player.name]) != 'GHOST'
          last_fragment = play_round
        end
        p "Player #{previous_player.name} is eliminated, is found his last #{record(@losses[previous_player.name])} word : #{last_fragment}"
        eliminate_player
      end
      p "Player #{current_player.name} win"
    end
end

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
    end

    def play_round
      while !@dictionary.has_key?(@fragment.to_sym)
        take_turn(current_player)
        next_player!
      end
      p "Player #{previous_player.name} lost he found #{@fragment}"
      @fragment = ""
      nil
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

    def ask_letter_to_add(player)
      p "Player #{player.name} enter a letter: "
      guess_letter = gets.chomp
      guess_letter
    end

    def is_valid_fragment?(string)
      @dictionary.each do |key, value|
        return true if key.to_s.include?(string)
      end
      false
    end

    def valid_play?(string)
      alphabet = ("a".."z").to_a + ("A".."Z").to_a
      test = @fragment + string

      alphabet.include?(string) && is_valid_fragment?(test)
    end

    def take_turn(player)
      guess_letter = ask_letter_to_add(player)
      player.guess = guess_letter
      
      while !valid_play?(player.guess)
        player.alert_invalid_guess
        guess_letter = ask_letter_to_add(player)
      end
      @fragment += guess_letter
    end
end

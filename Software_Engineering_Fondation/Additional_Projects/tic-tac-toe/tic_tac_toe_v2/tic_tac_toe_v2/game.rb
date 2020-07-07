#require_relative 'board'
#require_relative 'human_player'
$LOAD_PATH << "."

require 'board.rb'
require 'human_player'


class Game
  def initialize(n, player_1_mark, player_2_mark)
    @board = Board.new(n)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @player_1.active = true
    @current_player = @player_1
  end

  def switch_turn
    @player_1.active, @player_2.active = @player_2.active, @player_1.active
    return @current_player = ( @player_1.active ? @player_1 : @player_2)
  end

  def play
    while @board.empty_positions?
      position = nil
      is_valid_position = false
      while !is_valid_position
        position  = @current_player.get_position #Get position from the current user
        is_valid_position = true if @board.valid?(position) && @board.empty?(position)
      end
        @board.place_mark(position, @current_player.mark)
        @board.print
      if @board.win?(@current_player.mark)
        print "VICTORY"
        p "Player: #{@current_player} won"
        return
      else
        switch_turn
      end
    end
    p "Draw"
  end
end

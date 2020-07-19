require_relative 'list.rb'

class TodoBoard

  # Section Initialisation
  #
  def initialize
    @board = Hash.new
    # @list[label] = List.new(label)    
  end

  # Section board command
  # 
  # 

  def get_command
 #   puts "Enter Command in the format 'CMD <option_1> <option_2> separated by space"
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')
    list_label, *args_item = args 
    @list = @board[list_label.to_sym] if !list_label.nil?

    case cmd
      when 'mklist'
        @board[args[0].to_sym] = List.new(*args) 
      when 'ls'
        @board.each do |label, list|
          p label
        end
      when 'showall'
        @board.each do |label, list|
          list.print
        end
      when 'mktodo'
        @list.add_item(*args_item)
      when 'rm'
        p args_item.map!(&:to_i)
        @list.remove_item(*args_item)
      when 'purge'
        @list.purge
      when 'up'
        args_item.map!(&:to_i)
        @list.up(*args_item)
      when 'down'
        args_item.map!(&:to_i)
        @list.down(*args_item)
      when 'toggle'
        args_item.map!(&:to_i)
        @list.toggle_item(*args_item)
      when 'swap'
        args_item.map!(&:to_i)
        @list.swap(*args_item)
      when 'sort'
        @list.sort_by_date!
      when 'priority'
        @list.print_priority
      when 'print'
        if args_item.empty?
          @list.print
        else
          args_item.map!(&:to_i)
          @list.print_full_item(*args_item)
        end
      when 'quit'
        return false
      else
        print 'Sorry, that command is not recognized.'
        puts
      end

    true
  end

  def run
    while self.get_command
    end
  end

end

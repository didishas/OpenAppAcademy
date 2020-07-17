require_relative 'list.rb'

class TodoBoard

  # Section Initialisation
  #
  def initialize(label)
    @list = List.new(label)    
  end

  # Section board command
  # 
  # 

  def get_command
    puts "Enter Command in the format 'CMD <option_1> <option_2> separated by space"
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')

    case cmd
      when 'mktodo'
        @list.add_item(*args)
      when 'up'
        args.map!(&:to_i)
        @list.up(*args)
      when 'down'
        args.map!(&:to_i)
        @list.down(*args)
      when 'swap'
        args.map!(&:to_i)
        @list.swap(*args)
      when 'sort'
        @list.sort_by_date!
      when 'priority'
        @list.print_priority
      when 'print'
        if args.empty?
          @list.print
        else
          args.map!(&:to_i)
          @list.print_full_item(*args)
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

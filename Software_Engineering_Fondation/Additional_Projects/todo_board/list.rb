require_relative 'item.rb'

class List

  # Section -- Getters && Setters
  attr_accessor :label
  # End Section

  # Section -- initialisation
  def initialize(label)
    @label = label
    @items = []
  end
  # End Section

  # Section -- Items manipulation
  #
  # Helpers use to add items on the list
  # helpers to check if item exists
  # Helpers to swap items
  # helpers to access individual item
  def add_item(title, deadline, description = '')
    begin
      item = Item.new(title, deadline,description)
      @items << item
      true
    rescue ArgumentError
      false    
    end
  end


  def toggle_item(index)
    @items[index].toggle
  end

  def size
    @items.size
  end

  def valid_index?(index)
    return false if index < 0 || index > (self.size - 1)
    true
  end

  def [](index)
    @items[index]
  end

  def swap(index_1, index_2)
    return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
   @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
   true
  end
  
  def priority
    self[0]
  end

  def remove_item(index)
    return false if !self.valid_index?(index)
    @items.slice!(index)
    true
  end


  def purge
    @items.reject! {|item| item.done == true}
  end
  #End Section

  # Section -- Printing
  #
  # Helpers use to print the all list
  # Helpers use to print individual list
  def print
    puts ''.ljust(48, '-')
    puts @label.upcase.center(54, ' ')
    puts ''.ljust(48, '-')
    puts "Index | Item                 | Deadline   | Done "
    puts ''.ljust(48, '-')

    @items.each_with_index do |item, index|
      value = ( item.done ? "✓": " ")
      text = "#{index}".ljust(5, ' ') + " | " + "#{item.title}".ljust(21, ' ') + '|' + " #{item.deadline.strftime("%d-%m-%Y")}".ljust(12, ' ') + "|  [#{value}]"
      puts text
    end
    puts ''.ljust(48, '-')
  end

  def print_full_item(index)
    if valid_index?(index)
      value = ( self[index].done ? "✓" : " ")
      puts ''.ljust(48, '-')
      item = self[index]
      text = "#{item.title}".ljust(21) + "#{item.deadline.strftime("%d-%m-%Y")}".rjust(12) + " [#{value}] ".rjust(14, ' ')  + "\n" + "#{item.description}"
      puts text
      puts ''.ljust(48, '-')
    end
  end

  def print_priority
    print_full_item(0)
  end

  # End Section

  # Section -- Moving up && down
  #
  # Helpers use to move up item
  # Helpers use to move item down 

  def up(index, amount = 1)
    return false if !self.valid_index?(index)

    while amount > 0
      break if index == 0
      @items[index], @items[index - 1] = @items[index - 1], @items[index]
      index -= 1
      amount -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false if !self.valid_index?(index)

    while amount > 0
      break if index == @items.size - 1 
      @items[index], @items[index + 1] = @items[index + 1], @items[index]
      index += 1
      amount -= 1
    end
    true
  end

  # End Section
  #

  def sort_by_date!
    @items.sort_by! { |item| item.deadline.strftime("%d-%m-%Y")}
  end
end

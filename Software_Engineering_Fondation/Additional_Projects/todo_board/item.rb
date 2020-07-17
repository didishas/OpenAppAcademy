require 'date'

class Item

  def self.valid_date?(date)
    y, m, d = date.split('-')
    Date.valid_date?(y.to_i, m.to_i, d.to_i)
  end

  attr_reader :deadline, :done
  attr_accessor :title, :description

  def initialize(title, deadline, description)
    if Item.valid_date?(deadline)
      @title = title
      @deadline = Date.parse(deadline)
      @description = description
      @done = false
    else
      p 'raises error due to invalid date'
      raise ArgumentError
    end
  end

  def deadline=(date)
    if Item.valid_date?(date)
      @deadline = Date.parse(date)
    else
      p 'deadline is not valid'
      raise ArgumentError
    end
  end

  def toggle
    @done = !done
  end

end


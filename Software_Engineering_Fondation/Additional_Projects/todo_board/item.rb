require 'date'

class Item

  def self.valid_date?(date)
    y, m, d = date.split('-')
    Date.valid_date?(y.to_i, m.to_i, d.to_i)
  end

  attr_reader :deadline
  attr_accessor :title, :description

  def initialize(title, deadline, description)

    if Item.valid_date?(deadline)
      @title = title
      @deadline = Date.parse(deadline)
      @description = description
    else
      raise 'raises error due to invalid date'
    end
  end

  def deadline (date)
    if Item.valid_date?(date)
      @deadline = Date.parse(date)
    else
      raise 'deadline is not valid'
    end
  end
end


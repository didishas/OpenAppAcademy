class Passenger
  attr_reader :name
  def initialize(name)
    @name = name
    @flight_numbers = Array.new    
  end

  def has_flight?(flight_num)
    @flight_numbers.each do |val|
      return true if val.downcase == flight_num.downcase
    end
    return false
  end


  def add_flight(flight_num)
    @flight_numbers << flight_num.upcase if !self.has_flight?(flight_num)
  end

end

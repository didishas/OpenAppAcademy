class Flight
  attr_reader :passengers

  def initialize(flight_num, capacity)
    @flight_number = flight_num
    @capacity = capacity
    @passengers = []
  end

  def full?
    @passengers.size == @capacity ? true : false
  end

  def board_passenger(passenger)
   if !self.full?
     @passengers << passenger if passenger.has_flight?(@flight_number)
   end
  end


  def list_passengers
    list = []
    passengers.each do |passenger|
      list << passenger.name
    end
    list
  end

  def [] (number)
    @passengers[number]
  end

  def << (passenger)
    board_passenger(passenger)
  end
end

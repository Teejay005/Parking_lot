class Attendant
  attr_accessor :name, :parking_lots

  def initialize (name, parking_lots = [])
    @name = name
    @parking_lots = parking_lots
    parking_lots.each do |parking_lot|
      parking_lot.add_observer self
    end
    reorder_available_lots
  end

  def update
    reorder_available_lots
  end

  def check_if_parking_lot_full parking_lot
    parking_lot.full? ? 'Park is full' : 'Park is not full'
  end

  def park
    if (@available_lots.empty?)
      raise 'No available parking lot'
    else
      @available_lots.first.park
    end
  end

  def available_lots
    @parking_lots.select { |parking_lot| !parking_lot.full? }
  end

  def reorder_available_lots
    @available_lots = available_lots
  end

end

require File.expand_path(File.dirname(__FILE__) + '/attendant.rb')

class Trainee < Attendant

  def available_lots
    @parking_lots.select { |parking_lot| parking_lot.determine_percentage_full < 80 }
  end

end

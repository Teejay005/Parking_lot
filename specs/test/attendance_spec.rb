$:.unshift '../src/'
require 'rspec'
require 'attendant'
require 'parking_lot'
require 'trainee'

describe Attendant do
  it 'should create an Attendant with the right name' do
    attendant = Attendant.new 'test_name'
    attendant.name.should == 'test_name'
  end

  it 'should park a car' do
    parking_lot = Parking_lot.new 3
    parking_lot.park
    parking_lot.num_of_cars.should ==1
  end

  it 'should know when the parking lot is full' do
    parking_lot = Parking_lot.new 4
    attendant = Attendant.new 'test_name',[parking_lot]
    assistant_attendant = Attendant.new "assist name",[parking_lot]
    2.times do
      attendant.park
    end
    assistant_attendant.park
    parking_lot.park

    parking_lot.full?.should ==true
  end

  it "should know percentage usage of parking lot" do
    parking_lot =Parking_lot.new 4

    attendant = Attendant.new "new name" ,[parking_lot]
     attendant.park

    parking_lot.determine_percentage_full.should == 25

  end

  it "should not assigned lot eighty percent full to a trainee" do
    parking_lot =Parking_lot.new 4

    attendant = Attendant.new "new name" ,[parking_lot]
    attendant.park

    parking_lot.determine_percentage_full.should == 25

  end

  it "should allow a trainee park a car in a lot less than 80% full" do
    parking_lot =Parking_lot.new 4

    attendant = Attendant.new "new name" ,[parking_lot]
    trainee =Trainee.new "trainee", [parking_lot]

    3.times do
      attendant.park
    end
    trainee.park
    parking_lot.num_of_cars.should == 4
  end

  it "should not allow a trainee park a car in a lot greater than 80% full" do
    parking_lot =Parking_lot.new 10

    attendant = Attendant.new "new name" ,[parking_lot]
    trainee =Trainee.new "trainee", [parking_lot]

    9.times do
      attendant.park
    end
    expect {trainee.park}.to raise_error(RuntimeError, 'No available parking lot')
    parking_lot.num_of_cars.should == 9
  end

end

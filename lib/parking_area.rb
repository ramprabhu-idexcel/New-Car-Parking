class ParkingArea
  attr_accessor :size

  def self.leave(number)
    slot = Slot.all.select {|slot| slot.number == number}.first
    Car.all.reject! {|car| car.id == slot.car_id } if slot
    Slot.all.reject! {|slot| slot.number == number}
    puts "Slot number #{slot.number} is free"
  end
end

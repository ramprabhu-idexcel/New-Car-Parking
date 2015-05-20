require_relative "../lib/car"
require_relative "../lib/slot"
require "test/unit"

class TestCar < Test::Unit::TestCase

  def test_count
    Car.new(1,"KA-01-45","White")
    assert_equal(1,  Car.all.count)
    Car.new(2,"AK-02-45","Black")
    assert_equal(2,  Car.all.count)
  end

  def test_find_by_color
    car = Car.find_by_color("White").first
    assert_equal("KA-01-45",car.reg_no)
  end

  def test_find_by_regno
    car = Car.find_by_reg_no("KA-01-45").first
    assert_equal("White",car.color)
  end

  def test_validate_attributes
    assert_raise( RuntimeError ) { Car.new(nil,nil,nil) }
  end

end

class TestSlot < Test::Unit::TestCase

  def test_count
    car = Car.all.first
    Slot.new(1,car.id,"TestSlot")
    assert_equal(1,Slot.all.count)
  end

  def test_find_by_color
    slot = Slot.find_by_color("White").first
    assert_equal(1,slot.number)
  end

  def test_find_by_regno
    slot = Slot.find_by_reg_no("KA-01-45").first
    assert_equal(1,slot.number)
  end

  def test_no_color
    slot = Slot.find_by_color("Yellow").first
    assert_nil(slot)
  end

  def test_no_regno
    slot = Slot.find_by_reg_no("KA-01-98").first
    assert_nil(slot)
  end

  def test_validate_attributes
    assert_raise( RuntimeError ) { Slot.new(nil,nil,nil) }
  end
end
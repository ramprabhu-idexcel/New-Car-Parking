class Slot
  @@slots = []
  attr_accessor :number,:name,:car_id

  def initialize(number,car_id,name="Perk")
    @number = number
    @car_id = car_id
    @name = name
    validate_attributes
  end

  def self.all
    @@slots
  end

  [:color,:reg_no].collect do |method|
    define_singleton_method("find_by_#{method.to_s}") do |argument|
      car_ids = Car.send("find_by_#{method.to_s}",argument).map(&:id)
      all.select { |slot| slot if car_ids.include?(slot.car_id) }
    end
  end

  private

  def validate_attributes
    if self.number && self.car_id && self.name
      @@slots << self
    else
      raise "Slot number, car id, name can't be null"
    end
  end
end

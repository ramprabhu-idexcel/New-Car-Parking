class Car
  @@cars = []
  attr_accessor :id,:reg_no,:model,:color

  def initialize(id,reg_no,color,model='TK')
    @id = id
    @reg_no = reg_no
    @model = model
    @color = color
    validate_attributes
  end

  def self.all
    @@cars
  end

  [:color,:reg_no].collect do |method|
    define_singleton_method("find_by_#{method.to_s}") { |argument| all.select {|car| car if car.send(method) == argument } }
  end

  private

  def validate_attributes
    if self.id && self.reg_no && self.model && self.color
      @@cars << self
    else
      raise "Car register no,model,color can't be null"
    end
  end
end

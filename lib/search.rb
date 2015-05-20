class Search

  def keyword_search(arg)
    @arg = arg.chomp
    case
      when @arg.match(/create_parking_lot/)
        create_parking_lot
      when @arg.match(/park/)
        allocate_slot
      when @arg.match(/leave/)
        cancel_slot
      when @arg.match(/status/)
        status
      when @arg.match(/registration_numbers_for_cars_with_colour/)
        registration_numbers_for_cars_with_colour
      when @arg.match(/slot_numbers_for_cars_with_colour/)
        slot_numbers_for_cars_with_colour
      when @arg.match(/slot_number_for_registration_number/)
        slot_number_for_registration_number
      else
        puts Error::input
    end
  end

  private

  def create_parking_lot
    @parking_area = ParkingArea.new
    @parking_area.size = @arg.split(" ")[1]
    puts "Created a parking lot with #{@parking_area.size} slots"
  end

  def allocate_slot
    return puts Error::parking_full if Slot.all.count == @parking_area.size.to_i
    (1..@parking_area.size.to_i).each do |number|
      unless exist_slot_number?(number)
       car = Car.new(number,@arg.split(" ")[1],@arg.split(" ")[2])
       slot = Slot.new(number,car.id)
       puts "Allocated slot number: #{slot.number}"
       break
      end
    end
  end

  def exist_slot_number?(number)
    Car.all.map(&:id).include?(number) && Slot.all.map(&:number).include?(number)
  end

  def status
    #status
    puts "Slot No. Registration No Colour"
    Car.all.collect {|car| puts "#{car.id} " + "#{car.reg_no} " + "#{car.color}"}
  end

  def cancel_slot
    #leave 4
    ParkingArea.leave(@arg.split(" ")[1].to_i)
  end

  def registration_numbers_for_cars_with_colour
    car = Car.find_by_color(@arg.split(" ")[1])
    puts car.empty? ? Error::not_found : car.map(&:reg_no).join(",")
  end

  def slot_numbers_for_cars_with_colour
    slot = Slot.find_by_color(@arg.split(" ")[1])
    puts slot.empty? ?  Error::not_found : slot.map(&:number).join(",")
  end

  def slot_number_for_registration_number
    slot = Slot.find_by_reg_no(@arg.split(" ")[1])
    puts slot.empty? ?  Error::not_found : slot.map(&:number)
  end
end
class Owner
  attr_reader :name, :occupation, :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car)
    split = car.split(' ')
    year = split[0]
    description = [
      split[1] + ' ',
      split[2] + ' ',
      split[3]
    ].join
    car_object = Car.new({
      description: description,
      year: year
    })
    @cars << car_object
    car_object
  end

  def vintage_cars
    current_year = Time.new.year
    results = @cars.find_all do |car|
      current_year - car.year.to_i > 24
    end
  end
end

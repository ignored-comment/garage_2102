class Garage
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_cars
    result = []
    @customers.each do |customer|
      customer.cars.each {|car| result << car}
    end
    result
  end

  def cars_by_make
    result = {}
    @customers.each do |customer|
      customer.cars.each do |car|
        result[car.make] = [] if result[car.make].nil?
        result[car.make] << car
      end
    end
    result
  end

  def oldest_cars
    cars = []
    @customers.each do |customer|
      customer.cars.each do |car|
        cars << car
      end
    end
    result = cars.sort_by {|car| car.year}
    result.first(3)
  end
end

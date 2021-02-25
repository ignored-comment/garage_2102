require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require './lib/garage'

class GarageTest < Minitest::Test
  def test_it_exists
    garage = Garage.new('Totally Safe Parking')
    assert_instance_of Garage, garage
  end

  def test_it_has_readable_attributes
    garage = Garage.new('Totally Safe Parking')
    assert_equal 'Totally Safe Parking', garage.name
    assert_equal [], garage.customers
  end

  def test_it_can_add_customers
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new(
      'Glen Coco',
      'Unknown'
    )
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)
    result = [owner_1, owner_2]
    assert_equal result, garage.customers
  end

  def test_it_can_list_all_cars
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
    car1 = owner_1.buy('1967 Green Ford Mustang')
    car2 = owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new(
      'Glen Coco',
      'Unknown'
    )
    car3 = owner_2.buy('1963 Green Chevrolet Corvette')
    car4 = owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    result = [car1, car2, car3, car4]
    assert_equal result, garage.all_cars
  end

  def test_it_can_list_cars_by_make
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
    car1 = owner_1.buy('1967 Green Ford Mustang')
    car2 = owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new(
      'Glen Coco',
      'Unknown'
    )
    car3 = owner_2.buy('1963 Green Chevrolet Corvette')
    car4 = owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    result = {
      "Ford" => [car1, car2],
      "Chevrolet" => [car3],
      "Volvo" => [car4]
    }
    assert_equal result, garage.cars_by_make
  end

  def test_it_returns_3_oldest_cars
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
    car1 = owner_1.buy('1967 Green Ford Mustang')
    car2 = owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new(
      'Glen Coco',
      'Unknown'
    )
    car3 = owner_2.buy('1963 Green Chevrolet Corvette')
    car4 = owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    result = [car3, car1, car2]
    assert_equal result, garage.oldest_cars
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'

class CarTest < Minitest::Test
  def test_it_exists
    car_1 = Car.new({
      description: 'Green Ford Mustang',
      year: '1967'
      })
    assert_instance_of Car, car_1
  end

  def test_it_has_readable_attributes
    car_1 = Car.new({
      description: 'Green Ford Mustang',
      year: '1967'
      })
    assert_equal '1967', car_1.year
  end

  def test_it_can_get_make
    car_1 = Car.new({
      description: 'Green Ford Mustang',
      year: '1967'
      })
    assert_equal "Ford", car_1.make
  end

  def test_it_can_get_model
    car_1 = Car.new({
      description: 'Green Ford Mustang',
      year: '1967'
      })
    assert_equal "Mustang", car_1.model
  end

  def test_it_can_get_color
    car_1 = Car.new({
      description: 'Green Ford Mustang',
      year: '1967'
      })
    assert_equal "Green", car_1.color
  end

  def test_it_can_calculate_age
    car_1 = Car.new({
      description: 'Green Ford Mustang',
      year: '1967'
      })
    assert_equal 54, car_1.age
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require 'mocha/minitest'

class OwnerTest < Minitest::Test
  def test_it_exists
  owner_1 = Owner.new(
    'Regina George',
    'Heiress'
  )
  assert_instance_of Owner, owner_1
  end

  def test_it_has_readable_attributes
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
  assert_equal "Regina George", owner_1.name
  assert_equal "Heiress", owner_1.occupation
  assert_equal [], owner_1.cars
  end

  def test_owner_can_buy_cars
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
  assert_instance_of Car, owner_1.buy('1967 Green Ford Mustang')
  end

  def test_it_can_list_purchased_cars
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
    result1 = owner_1.buy('1967 Green Ford Mustang')
    result2 = owner_1.buy('2001 Silver BMW 3-Series')
    result3 = owner_1.buy('1963 Red Chevrolet Corvette')
    assert_equal [result1, result2, result3], owner_1.cars
  end

  def test_it_can_return_vintage_cars
    owner_1 = Owner.new(
      'Regina George',
      'Heiress'
    )
    result1 = owner_1.buy('1967 Green Ford Mustang')
    result2 = owner_1.buy('2001 Silver BMW 3-Series')
    result3 = owner_1.buy('1963 Red Chevrolet Corvette')
    assert_equal [result1, result3], owner_1.vintage_cars
  end
end

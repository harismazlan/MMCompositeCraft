require 'test_helper'

class BoatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boat = boats(:one)
  end

  test "should get index" do
    get boats_url
    assert_response :success
  end

  test "should get new" do
    get new_boat_url
    assert_response :success
  end

  test "should create boat" do
    assert_difference('Boat.count') do
      post boats_url, params: { boat: { class: @boat.class, condition: @boat.condition, fuel_type: @boat.fuel_type, hull_material: @boat.hull_material, length: @boat.length, make: @boat.make, model: @boat.model, price: @boat.price, type: @boat.type, year: @boat.year } }
    end

    assert_redirected_to boat_url(Boat.last)
  end

  test "should show boat" do
    get boat_url(@boat)
    assert_response :success
  end

  test "should get edit" do
    get edit_boat_url(@boat)
    assert_response :success
  end

  test "should update boat" do
    patch boat_url(@boat), params: { boat: { class: @boat.class, condition: @boat.condition, fuel_type: @boat.fuel_type, hull_material: @boat.hull_material, length: @boat.length, make: @boat.make, model: @boat.model, price: @boat.price, type: @boat.type, year: @boat.year } }
    assert_redirected_to boat_url(@boat)
  end

  test "should destroy boat" do
    assert_difference('Boat.count', -1) do
      delete boat_url(@boat)
    end

    assert_redirected_to boats_url
  end
end

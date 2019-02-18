require "application_system_test_case"

class BoatsTest < ApplicationSystemTestCase
  setup do
    @boat = boats(:one)
  end

  test "visiting the index" do
    visit boats_url
    assert_selector "h1", text: "Boats"
  end

  test "creating a Boat" do
    visit boats_url
    click_on "New Boat"

    fill_in "Class", with: @boat.class
    fill_in "Condition", with: @boat.condition
    fill_in "Fuel type", with: @boat.fuel_type
    fill_in "Hull material", with: @boat.hull_material
    fill_in "Length", with: @boat.length
    fill_in "Make", with: @boat.make
    fill_in "Model", with: @boat.model
    fill_in "Price", with: @boat.price
    fill_in "Type", with: @boat.type
    fill_in "Year", with: @boat.year
    click_on "Create Boat"

    assert_text "Boat was successfully created"
    click_on "Back"
  end

  test "updating a Boat" do
    visit boats_url
    click_on "Edit", match: :first

    fill_in "Class", with: @boat.class
    fill_in "Condition", with: @boat.condition
    fill_in "Fuel type", with: @boat.fuel_type
    fill_in "Hull material", with: @boat.hull_material
    fill_in "Length", with: @boat.length
    fill_in "Make", with: @boat.make
    fill_in "Model", with: @boat.model
    fill_in "Price", with: @boat.price
    fill_in "Type", with: @boat.type
    fill_in "Year", with: @boat.year
    click_on "Update Boat"

    assert_text "Boat was successfully updated"
    click_on "Back"
  end

  test "destroying a Boat" do
    visit boats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Boat was successfully destroyed"
  end
end

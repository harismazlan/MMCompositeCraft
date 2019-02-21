require 'rails_helper'
require 'capybara/rails'

RSpec.describe Boat, type: :model do

	it 'creates a new boat with valid data' do
		expect(Boat.create!(make: 'afds', model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl')).to be_valid
	end

	it 'creates a new boat without make' do
		expect{ Boat.create!(model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Make can\'t be blank')
	end

	it 'creates a new boat without model' do
		expect{ Boat.create!(make: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Model can\'t be blank')
	end

	it 'creates a new boat without year' do
		expect{ Boat.create!(make: 'asdasd', model: 'sgdgf', condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Year can\'t be blank')
	end

	it 'creates a new boat without condition' do
		expect{ Boat.create!(make: 'asdasdad', model: 'sgdgf', year: 1929, price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Condition can\'t be blank')
	end

	it 'creates a new boat without price' do
		expect{ Boat.create!(make: 'asdsad', model: 'sgdgf', year: 1929, condition: 'qwertyu', make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Price can\'t be blank')
	end

	it 'creates a new boat without make_type' do
		expect{ Boat.create!(make: 'gfgfgf', model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, boat_class: 'loloo', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Make type can\'t be blank')
	end

	it 'creates a new boat without boat_class' do
		expect{ Boat.create!(make: 'trrte', model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', length: 123, fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Boat class can\'t be blank')
	end

	it 'creates a new boat without length' do
		expect{ Boat.create!(make: 'afds', model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', fuel_type: 'sdfsf', hull_material: 'ghjkl') }.to raise_error('Validation failed: Length can\'t be blank')
	end

	it 'creates a new boat without fuel_type' do
		expect{ Boat.create!(make: 'afds', model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, hull_material: 'ghjkl') }.to raise_error('Validation failed: Fuel type can\'t be blank')
	end

	it 'creates a new boat without hull_material' do
		expect{ Boat.create!(make: 'afds', model: 'sgdgf', year: 1929, condition: 'qwertyu', price: 100000, make_type: 'sdfsf', boat_class: 'loloo', length: 123, fuel_type: 'sdfsf') }.to raise_error('Validation failed: Hull material can\'t be blank')
	end

end

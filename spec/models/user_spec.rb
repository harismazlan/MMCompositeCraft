# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a new user with valid data' do
    expect(User.create!(first_name: 'afds', last_name: 'sgdgf', email: 'dasdasd@example.com', password: 'qwertyu', phone_number: 'asdasdasd')).to be_valid
  end

  it 'creates a new user without first name' do
    expect { User.create!(last_name: 'sgdgf', email: 'dasdasd@example.com', password: 'qwertyu', phone_number: 'asdasdasd') }.to raise_error('Validation failed: First name can\'t be blank')
  end
  # curly brackets used instead of normal bracket to capture error
  # since this is an unhappy path

  it 'creates a new user without last name' do
    expect { User.create!(first_name: 'sgdgf', email: 'dasdasd@example.com', password: 'qwertyu', phone_number: 'asdasdasd') }.to raise_error('Validation failed: Last name can\'t be blank')
  end

  it 'creates a new user without password' do
    expect { User.create!(first_name: 'sgdgf', last_name: 'qwertyu', email: 'dasdasd@example.com', phone_number: 'asdasdasd') }.to raise_error('Validation failed: Password can\'t be blank, Password is too short (minimum is 7 characters)')
  end

  it 'should have password length more than 6 characters' do
    expect { User.create!(first_name: 'afds', last_name: 'sgdgf', email: 'dasdasd@example.com', password: 'qwerty', phone_number: 'asdasdasd') }.to raise_error('Validation failed: Password is too short (minimum is 7 characters)')
  end

  it 'creates new user without email' do
    expect { User.create!(first_name: 'sgdgf', last_name: 'qwertyu', password: 'qwertyu', phone_number: 'asdasdasd') }.to raise_error('Validation failed: Email is invalid, Email can\'t be blank')
  end

  it 'should have a unique email' do
    user1 = User.create!(first_name: 'afds', last_name: 'sgdgf', email: 'dasdasd@example.com', password: 'qwertyu', phone_number: 'asdasdasd')
    expect { User.create!(first_name: 'afds', last_name: 'sgdgf', email: 'dasdasd@example.com', password: 'qwertyu', phone_number: 'asdasdasd') }.to raise_error('Validation failed: Email has already been taken')
  end

  it 'should have a proper email format' do
    expect { User.create!(first_name: 'afds', last_name: 'sgdgf', email: 'dasd', password: 'qwertyu', phone_number: 'asdasdasd') }.to raise_error('Validation failed: Email is invalid')
  end

  it 'should have many appointments' do
    expect(User.reflect_on_association(:appointments).macro).to eq(:has_many)
  end

  it 'should have many authentications' do
    expect(User.reflect_on_association(:appointments).macro).to eq(:has_many)
  end
end

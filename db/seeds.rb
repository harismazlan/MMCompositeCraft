# frozen_string_literal: true

# Seed Admins
User.create(first_name: 'Mazlan', last_name: 'Manaf', email: 'mazlanmanaf@gmail.com', password: '1234567', password_confirmation: '1234567', phone_number: '+60122053600', access_level: 1)
User.create(first_name: 'Haris', last_name: 'Mazlan', email: 'haris_mazlan@yahoo.co.uk', password: '1234567', password_confirmation: '1234567', phone_number: '+60172621700', access_level: 1)

# Seed Users
user = {}
user['password'] = 'asdfasd'
user['password_confirmation'] = 'asdfasd'
ActiveRecord::Base.transaction do
  400.times do
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['phone_number'] = Faker::PhoneNumber.phone_number
    User.create(user)
  end
end

# Seed Boats
boat = {}
ActiveRecord::Base.transaction do
  800.times do
    boat['make'] = ['Monterey', 'Leopard', 'Sea Ray', 'Nantucket', 'Jeanneau', 'Marlow', 'Silverton', 'Cutwater', 'Maverick Boat Co.', 'Riviera'].sample
    boat['model'] = ['328SS', '39 Motor Yacht', 'C-28', 'Mirage 18 HPX-V', 'Sun Odyssey 409', '72E-LR', '42 Flybridge', '270 Sundancer', 'Island'].sample
    boat['year'] = rand(1995..2020)
    boat['condition'] = %w[New Used].sample
    boat['price'] = rand(30_000..400_000)
    boat['make_type'] = %w[Sail Power].sample
    boat['boat_class'] = ['Express Cruiser', 'Flybridge', 'Cruiser (Power)', 'Cruiser (Sail)', 'Flats', 'Downeast', 'Motor Yacht', 'Sports Cruiser', 'Center Cockpit'].sample
    boat['length'] = rand(30..100)
    boat['fuel_type'] = %w[Diesel Gas].sample
    boat['hull_material'] = %w[Wooden Fibreglass Composite Steel].sample
    Boat.create(boat)
  end
end

# Seed Appointments
appointment = {}
uids = []
User.all.each { |u| uids << u.id }
ActiveRecord::Base.transaction do
  200.times do
    appointment['user_id'] = uids.sample
    appointment['appointment_date'] = Faker::Time.between(DateTime.now + 30, DateTime.now + 2000)
    appointment['appointment_status'] = %w[Pending Rejected Accepted].sample
    appointment['appointment_info'] = Faker::Hipster.sentence
    Appointment.create(appointment)
  end
end

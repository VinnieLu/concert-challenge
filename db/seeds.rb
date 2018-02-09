require 'faker'

Concert.destroy_all
User.destroy_all
Attendance.destroy_all

15.times do
  Concert.create(band: Faker::RockBand.name, venue: "#{Faker::LordOfTheRings.location}", date: Faker::Date.forward(rand(30)), start_time: "8:00 PM")
end

5.times do |number|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "#{number}@email.com", password_hash: "password")
end

concerts = Concert.all
users = User.all

50.times do
  attendance = Attendance.create!(user_id: users.sample.id, concert_id: concerts.sample.id)
end

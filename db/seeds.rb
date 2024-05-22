# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Flat.destroy_all

puts 'Creating flats...'
10.times do
  flat = Flat.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    description: Faker::Quote.fortune_cookie,
    price_per_night: Faker::Number.between(from: 100, to: 10_000),
    number_of_guests: Faker::Number.between(from: 1, to: 10)
  )
  flat.save
  puts "Created #{flat.name}"
end
puts 'Finished!'

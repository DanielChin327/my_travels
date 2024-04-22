# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Country.destroy_all

puts "Creating countries..."
japan = {name: "Japan"}
korea = {name: "Korea"}
singapore = {name: "Singapore"}

countries = [japan, korea, singapore]

countries.each do |attributes|
  country = Country.create!(attributes)
  puts "Created #{country.name}"
end

puts "Finished!"

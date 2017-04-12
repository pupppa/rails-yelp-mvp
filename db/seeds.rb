# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name: "Epicure au Bristol",
    address: "112 rue du Fg St-Honoré 75008 Paris",
    phone_number: "93827254859",
    category: "French"
  },
  {
    name: "Sushi da Vila Madalena",
    address: "Mourato Coelho, 234",
    phone_number: "548593467",
    category: "Japanese"
  }
]
Restaurant.create!(restaurants_attributes)

Restaurant.all.each do |restaurant|

  reviews_attributes = [
  {
    content: "Muito bom!",
    rating: 5,
    restaurant: restaurant
  },
   {
    content: "Muito ruim!",
    rating: 1,
    restaurant: restaurant
  }
]
Review.create!(reviews_attributes)

end




puts 'Finished!'

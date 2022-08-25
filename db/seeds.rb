# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all
50.times do
  user = User.create(username: Faker::Artist.name, email: "#{Faker::Code.npi}@gmail.com", password: "123456")
end
User.create(username: "test", email: "test@gmail.com", password: "123456")
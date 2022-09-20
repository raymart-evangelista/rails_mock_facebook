# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([{
  username: "mwalker",
  first_name: "Muhamed",
  last_name: "Walker",
  email: "muhamedwalker@gmail.com",
  password: "password"
},
{
  username: "mvillegas",
  first_name: "Mali",
  last_name: "Villegas",
  email: "malivillegas@gmail.com",
  password: "password"
},
{
  username: "nmajor",
  first_name: "Noah",
  last_name: "Major",
  email: "noahmajor@gmail.com",
  password: "password"
},
{
  username: "ileal",
  first_name: "Isabell",
  last_name: "Leal",
  email: "isabellleal@gmail.com",
  password: "password"
},
{
  username: "kfinney",
  first_name: "Konrad",
  last_name: "Finney",
  email: "kfinney@gmail.com",
  password: "password"
},
{
  username: "sfranco",
  first_name: "Salman",
  last_name: "Franco",
  email: "sfranco@gmail.com",
  password: "password"
}])

Friendship.create!([{
  user_id: 1,
  friend_id: 2
},
{
  user_id: 1,
  friend_id: 3
}])

p "Created #{User.count} users"

p "Created #{Friendship.count} friendship objects"

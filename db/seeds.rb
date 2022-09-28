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
},
{
  username: "mbush",
  first_name: "Mollie",
  last_name: "Bush",
  email: "mbush@gmail.com",
  password: "password"
}])

FriendRequest.create!([{
  requestor_id: 1,
  receiver_id: 2
},
{
  requestor_id: 1,
  receiver_id: 3
},
{
  requestor_id: 4,
  receiver_id: 1
},
{
  requestor_id: 5,
  receiver_id: 1
}])

Friendship.create!([{
  friend_a_id: 1,
  friend_b_id: 6
}])

Post.create!([{
  content: "It was yellow and very pretty to say the least!",
  user_id: 1
},
{
  content: "I ate birria and pastor tacos for lunch. For dinner, I ate air fried chicken and protein pancakes.",
  user_id: 2
}])

Like.create!([{
  user_id: 1,
  post_id: 1
}])

p "Created #{User.count} users"
p "Created #{FriendRequest.count} friend requests"
p "Created #{Friendship.count} friendships"
p "Created #{Post.count} posts"
p "Created #{Like.count} likes"
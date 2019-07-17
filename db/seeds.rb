# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
arthur = User.create(first_name: "Arthur", email: "arth3rs0ng@gmail.com", password: "123")
bob = User.create(first_name: "Bob", email: "bob@gmail.com", password: "123")
mary = User.create(first_name: "Mary", email: "mary@gmail.com", password: "123")

lee_family = Family.create(last_name: "Lee")

Role.create(title: "Dad", user_id: bob.id, family_id: lee_family.id)
Role.create(title: "Mom", user_id: mary.id, family_id: lee_family.id)
Role.create(title: "Eldest", user_id: arthur.id, family_id: lee_family.id)

lee_board = Board.create(header: "Lee Family, We the Best Family")
lee_board.family = lee_family
lee_board.save

arthur.create_tag_for_this_familys_board(lee_family, "I love my family")
bob.create_tag_for_this_familys_board(lee_family, "I love my son Arthur and my wife Mary")
mary.create_tag_for_this_familys_board(lee_family, "What do you guys want for dinner?")
#binding.pry

#====== second family =========

eric = User.create(first_name: "Eric", email: "eric@gmail.com", password: "123")
robert = User.create(first_name: "Robert", email: "robert@gmail.com", password: "123")
mia = User.create(first_name: "Mia", email: "mia@gmail.com", password: "123")
    
wallace_family = Family.create(last_name: "Wallace", password: "123")
    
Role.create(title: "Dad", user_id: robert.id, family_id: wallace_family.id)
Role.create(title: "Mom", user_id: mia.id, family_id: wallace_family.id)
Role.create(title: "Eldest", user_id: eric.id, family_id: wallace_family.id)
    
wallace_board = Board.create(header: "Wallace Family, We're the Funny Family!")
wallace_board.family = wallace_family
wallace_board.save
    
eric.create_tag_for_this_familys_board(wallace_family, "Three tomatoes are walking down the street: mama tomato, papa tomato,
 and baby tomato. The baby tomato starts falling behind. What does the papa tomato say to the baby tomato???")
robert.create_tag_for_this_familys_board(wallace_family, "What does he say???")
mia.create_tag_for_this_familys_board(wallace_family, "Ketchup!!!")







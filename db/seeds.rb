# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Edition.destroy_all
Role.destroy_all
User.destroy_all
Campaign.destroy_all

editions = Edition.create([
    {name: "1st"},
    {name: "2nd"},
    {name: "3rd"},
    {name: "3.5"},
    {name: "4th"},
    {name: "5th"},
    {name: "Pathfinder"},
    {name: "Other"}
])

roles = Role.create([
    {name: "Bard"},
    {name: "Barbarian"},
    {name: "Cleric"},
    {name: "Druid"},
    {name: "Fighter"},
    {name: "Monk"},
    {name: "Paladin"},
    {name: "Rogue"},
    {name: "Ranger"},
    {name: "Sorcerer"},
    {name: "Warlock"},
    {name: "Wizard"},
    {name: "Other"}
])

users = User.create([
    {email: "ex1@email.com", username: "name1", age: 18, gender: "F", zipcode: 10000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex2@email.com", username: "name2", age: 28, gender: "F", zipcode: 20000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex3@email.com", username: "name3", age: 38, gender: "F", zipcode: 30000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex4@email.com", username: "name4", age: 48, gender: "F", zipcode: 40000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex5@email.com", username: "name5", age: 58, gender: "F", zipcode: 50000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex6@email.com", username: "name6", age: 68, gender: "F", zipcode: 60000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex7@email.com", username: "name7", age: 78, gender: "F", zipcode: 70000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"},
    {email: "ex8@email.com", username: "name8", age: 88, gender: "F", zipcode: 80000, active: true, password: "password", password_confirmation: "password", bio: "I love TTRPGS!"}
])

campaigns = Campaign.create([
    {name: "My Campaign", online: false, size: 4, description: "Blah blah blah orcs!", full: false, user: User.first, edition: Edition.first},
    {name: "Curse of Strahd", online: false, size: 7, description: "It's always sunny in Barovia.", full: false, user: User.first, edition: Edition.second},
    {name: "Tomb of Anihilation", online: false, size: 5, description: "No one's getting out alive.", full: false, user: User.first, edition: Edition.third},
    {name: 'Hidden Shrine of Tamoachan', description: 'Explore the hidden shrine.', online: false, size: 5, full: false, user: User.fifth, edition: Edition.fourth},
    {name: 'Sunless Citadel', description: 'Explore the burried Sunless Citadel.', online: false, size: 5, full: false, user: User.fifth, edition: Edition.last},
    {name: "Homebrew - Tal'Dorei", description: "Let's go to Whitestone!", online: false, size: 5, full: false, user: User.second, edition: Edition.first},
    {name: "Homebrew - Other", description: "This is basically the Adventure Zone but in space.", online: false, size: 5, full: false, user: User.second, edition: Edition.second}
])
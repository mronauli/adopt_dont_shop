# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "Dumb Friends League",
                           address: "2080 S Quebec St",
                           city: "Denver",
                           state: "CO",
                           zip: "81029")
shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                           address: "1241 W Bayaud Ave",
                           city: "Denver",
                           state: "CO",
                           zip: "81029")
pet_1 = Pet.create(picture: "/assets/dog-landing-hero-lg.jpg",
                   name: "Foxy",
                   description: "Enjoys pina coladas and getting caught in the rain",
                   age: "2",
                   sex: "female",
                   shelter: shelter_1,
                   adoption_status: "adoptable")
pet_2 = Pet.create(picture: "/assets/porkie.jpg",
                   name: "Angus",
                   description: "Not into yoga",
                   age: "1",
                   sex: "male",
                   shelter: shelter_2,
                   adoption_status: "adoptable")
pet_3 = Pet.create(picture: "/assets/tyga.jpg",
                   name: "Tyga",
                   description: "Has half a brain",
                   age: "4",
                   sex: "female",
                   shelter: shelter_2,
                   adoption_status: "not adoptable")

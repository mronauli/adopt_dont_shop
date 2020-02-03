require 'rails_helper'

RSpec.describe "pets' index page", type: :feature do
  context "as a visitor" do
    it "can see each pet and its' picture, name, approximate age, sex and name of shelter it's located" do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
                                 address: "3",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "81029")

      shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                                 address: "3",
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

      visit "/pets"
      expect(page).to have_css("img[src*='/assets/dog-landing-hero-lg.jpg']")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.shelter.name)
      expect(page).to have_css("img[src*='/assets/porkie.jpg']")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_content(pet_2.shelter.name)  
    end
  end
end

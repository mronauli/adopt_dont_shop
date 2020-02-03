require "rails_helper"

RSpec.describe "pet's page", type: :feature do
  context "as a visitor" do
    it "can see a specific pet and its image, name, description, age, sex and adoption status" do
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

      visit "/pets/#{pet_1.id}"
      expect(page).to have_css("img[src*='/assets/dog-landing-hero-lg.jpg']")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.adoption_status)

      visit "/pets/#{pet_2.id}"
      expect(page).to have_css("img[src*='/assets/porkie.jpg']")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.description)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_content(pet_2.adoption_status)

      visit "/pets/#{pet_3.id}"
      expect(page).to have_css("img[src*='/assets/tyga.jpg']")
      expect(page).to have_content(pet_3.name)
      expect(page).to have_content(pet_3.description)
      expect(page).to have_content(pet_3.age)
      expect(page).to have_content(pet_3.sex)
      expect(page).to have_content(pet_3.adoption_status)

      expect(page).to_not have_css("img[src*='/assets/porkie.jpg']")
      expect(page).to_not have_content(pet_2.name)
    end
      it "can see click a pet's name and take them to its page" do
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

        visit "/pets"
        expect(page).to have_content(pet_1.name)
        click_link(pet_1.name)
        expect(current_path).to eq("/pets/#{pet_1.id}")

        visit "/pets"
        expect(page).to have_content(pet_2.name)
        click_link(pet_2.name)
        expect(current_path).to eq("/pets/#{pet_2.id}")

        visit "/shelters/#{shelter_1.id}/pets"
        expect(page).to have_content(pet_1.name)
        click_link(pet_1.name)
        expect(current_path).to eq("/pets/#{pet_1.id}")

        visit "/shelters/#{shelter_2.id}/pets"
        expect(page).to have_content(pet_2.name)
        click_link(pet_2.name)
        expect(current_path).to eq("/pets/#{pet_2.id}")
    end
  end
end

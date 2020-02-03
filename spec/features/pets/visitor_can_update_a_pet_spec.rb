require 'rails_helper'

RSpec.describe "on a pet's show page", type: :feature do
  describe "as a visitor" do
    it "can click a link that takes them to a page where they can edit a pet's information" do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
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

      visit "/pets/#{pet_1.id}"
      expect(page).to have_content(pet_1.name)

      click_link "Update Pet"
      expect(current_path).to eq("/pets/#{pet_1.id}/edit")
    end
    it "can fill out a form and update a particular pet" do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
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

      visit "/pets/#{pet_1.id}"
      click_link "Update Pet"
      expect(current_path).to eq("/pets/#{pet_1.id}/edit")

      adoption_status = "not adoptable"

      fill_in :adoption_status, with: adoption_status
      click_button "Submit"
      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("not adoptable")
    end
  end
end

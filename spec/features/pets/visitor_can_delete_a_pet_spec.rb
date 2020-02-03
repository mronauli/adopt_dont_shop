require "rails_helper"

RSpec.describe "on a pet's show page", type: :feature do
  describe "as a visitor" do
    it "can see a delete pet link and delete a pet" do
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
      expect(page).to have_link "Delete Pet", href: "/pets/#{pet_1.id}"
      click_link "Delete Pet"
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content(pet_1.picture)
      expect(page).to_not have_content(pet_1.name)
      expect(page).to_not have_content(pet_1.age)
      expect(page).to_not have_content(pet_1.sex)
      expect(page).to_not have_content(pet_1.sex)
    end
  end
end

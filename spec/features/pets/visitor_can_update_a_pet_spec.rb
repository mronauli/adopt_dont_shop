require "rails_helper"

RSpec.describe "on the shelter pets index", type: :feature do
  describe "as a visitor" do
    it "can click a link that takes them to a page where they can add a pet for adoption" do
      shelter_1 = Shelter.create(name: "Dumb Friends League", address: "2080 S Quebec St", city: "Denver", state: "CO", zip: "81029")

      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_content(shelter_1.name)

      click_link "Create Pet"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    end
    it "can fill out a form to add a pet for adoption" do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
                                 address: "2080 S Quebec St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "81029")

      pet_1 = Pet.create(picture: "/assets/porkie.jpg",
                                name: "Angus",
                                description: "Not into yoga",
                                age: "1",
                                sex: "male",
                                shelter: shelter_1,
                                adoption_status: "adoptable")

      picture = "app/assets/images/pitbull.jpg"
      name = "Bruno"
      description = "Likes getting caught in the rain"
      age = "3"
      sex = "female"
      adoption_status = "adoptable"

      visit "/shelters/#{shelter_1.id}/pets/new"
      attach_file(:picture, picture)
      fill_in :name, with: name
      fill_in :description, with: description
      fill_in :age, with: age
      fill_in :adoption_status, with: adoption_status
      select :female, from: :sex

      click_on "Create Pet"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      # expect { click_on "Create Pet" }.to change(Pet, :count).by(1)
      expect(page).to have_css("img[src*='/assets/pitbull-a5c2c1ca32533e109a762f24fa5e3d14009344f48816dccee4c5a55c0871931f.jpg']")
      expect(page).to have_content(name)
      expect(page).to have_content(description)
      expect(page).to have_content(age)
      expect(page).to have_content(sex)
    end
  end
end

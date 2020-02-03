require "rails_helper"


describe "update shelters", type: :feature do
  context "as a visitor" do
    it "can click link that takes them to update a shelter" do
      shelter_1 = Shelter.create(name: "Dumb Friends League", address: "2080 S Quebec St", city: "Denver", state: "CO", zip: "81029")

      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_content(shelter_1.name)

      click_link "Update Shelter"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    end

    it "can fill out a form and update a particular shelter" do
      shelter_1 = Shelter.create(name: "Dumb Friends League", address: "2080 S Quebec St", city: "Denver", state: "CO", zip: "81029")

      visit "/shelters/#{shelter_1.id}"

      click_link "Update Shelter"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

      name = "Denver Pet Rescue"

      fill_in :name, with: name

      click_button "Submit"
      expect(current_path).to eq("/shelters")

      expect(page).to have_content("Denver Pet Rescue")
      end
    end
  end

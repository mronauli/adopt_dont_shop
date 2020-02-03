require 'rails_helper'

RSpec.describe "shelters' index page", type: :feature do
  context "as a visitor" do
    it "can see all shelters' names" do
      shelter_1 = Shelter.create(name: "Dumb Friends League", address: "3", city: "Denver", state: "CO", zip: "81029")
      shelter_2 = Shelter.create(name: "Denver Animal Shelter", address: "3", city: "Denver", state: "CO", zip: "81029")

      visit "/shelters"
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
    it "can see a link to edit a shelter's information" do
      shelter_1 = Shelter.create(name: "Dumb Friends League", address: "3", city: "Denver", state: "CO", zip: "81029")
      shelter_2 = Shelter.create(name: "Denver Animal Shelter", address: "3", city: "Denver", state: "CO", zip: "81029")

      visit "/shelters"
      click_link("Update Shelter", match: :first)
      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

      name = "Denver Pet Rescue"

      fill_in :name, with: name

      click_button "Submit"
      expect(current_path).to eq("/shelters")
      expect(page).to have_content("Denver Pet Rescue")
    end
    it "can see a link to delete a shelter" do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
                                 address: "3",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "81029")
      shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                                 address: "4",
                                 city: "Aurora",
                                 state: "CA",
                                 zip: "91763")

      visit "/shelters"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_link "Delete Shelter", href: "/shelters/#{shelter_1.id}"
      click_link("Delete Shelter", match: :first)

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(shelter_1.name)
      expect(current_path).to eq("/shelters")
      expect(page).to have_content(shelter_2.name)
    end
    it "can see a link on each page that takes them to shelter index" do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
                                 address: "3",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "81029")

      all("page").each do
        |page| page[href="/shelters"]
      end
    end
  end
end

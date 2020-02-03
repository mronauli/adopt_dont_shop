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
  end
end

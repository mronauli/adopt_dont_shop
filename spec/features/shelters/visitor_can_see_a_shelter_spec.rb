require 'rails_helper'

RSpec.describe "shelter's page", type: :feature do
  context "as a visitor" do
    it "can see a specific shelter and its name, address, city, state and zip" do

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

      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)

      visit "/shelters/#{shelter_2.id}"
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_content(shelter_2.address)
      expect(page).to have_content(shelter_2.city)
      expect(page).to have_content(shelter_2.state)
      expect(page).to have_content(shelter_2.zip)
    end
    # it "can click a link that will take them to a shelter's pet page" do
    #   shelter_1 = Shelter.create(name: "Dumb Friends League",
    #                              address: "3",
    #                              city: "Denver",
    #                              state: "CO",
    #                              zip: "81029")
    #   shelter_2 = Shelter.create(name: "Denver Animal Shelter",
    #                              address: "3",
    #                              city: "Denver",
    #                              state: "CO",
    #                              zip: "81029")
    #   pet_1 = Pet.create(picture: "/assets/dog-landing-hero-lg.jpg",
    #                      name: "Foxy",
    #                      description: "Enjoys pina coladas and getting caught in the rain",
    #                      age: "2",
    #                      sex: "female",
    #                      shelter: shelter_1,
    #                      adoption_status: "adoptable")
    #   pet_2 = Pet.create(picture: "/assets/porkie.jpg",
    #                      name: "Angus",
    #                      description: "Not into yoga",
    #                      age: "1",
    #                      sex: "male",
    #                      shelter: shelter_2,
    #                      adoption_status: "adoptable")
    #   pet_3 = Pet.create(picture: "/assets/tyga.jpg",
    #                      name: "Tyga",
    #                      description: "Has half a brain",
    #                      age: "4",
    #                      sex: "female",
    #                      shelter: shelter_2,
    #                      adoption_status: "not adoptable")
    #
    #   visit "/shelters/#{shelter_1.id}"
    #   click_link("All Pets")
    #   expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    #   expect(page).to have_content("Foxy")
    #
    #   visit "/shelters/#{shelter_2.id}"
    #   click_link("All Pets")
    #   expect(current_path).to eq("/shelters/#{shelter_2.id}/pets")
    #   expect(page).to have_content("Angus")
    #   expect(page).to have_content("Tyga")
    #   expect(page).to_not have_content("Foxy")
    # end
  end
end

require "rails_helper"

RSpec.describe "on the shelter pets index" do
  describe "as a visitor" do
    it "sees pets and all its information including the shelter id" do
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
                                shelter: shelter_1,
                                adoption_status: "adoptable")

      pet_3 = Pet.create(picture: "/assets/tyga.jpg",
                                name: "Tyga",
                                description: "Has half a brain",
                                age: "4",
                                sex: "female",
                                shelter: shelter_2,
                                adoption_status: "not adoptable")

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_css("img[src*='dog-landing-hero-lg.jpg']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.shelter.name)

    expect(page).to have_css("img[src*='porkie.jpg']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_2.shelter.name)

    expect(page).to_not have_css("img[src*='tyga.jpg']")
    expect(page).to_not have_content(pet_3.name)
    expect(page).to_not have_content(pet_3.age)
    expect(page).to_not have_content(pet_3.shelter.name)
    end
  end
end

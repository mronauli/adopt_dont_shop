require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'can delete an shelter' do
    shelter_1 = Shelter.create(name: "Dumb Friends League", address: "2080 S Quebec St", city: "Denver", state: "CO", zip: "81029")

    visit "/shelters/#{shelter_1.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter_1.name)
    expect(page).to_not have_content(shelter_1.address)
    expect(page).to_not have_content(shelter_1.city)
    expect(page).to_not have_content(shelter_1.state)
    expect(page).to_not have_content(shelter_1.zip)
  end
end

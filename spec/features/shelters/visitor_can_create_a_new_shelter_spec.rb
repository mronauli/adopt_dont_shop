require 'rails_helper'

RSpec.describe "shelters" do
  describe "post shelters", type: :feature do
    context "as a visitor" do
      it "can click a link that takes them to create shelter" do
        visit "/shelters"
        click_link "New Shelter"
        expect(current_path).to eq("/shelters/new")

        name = "Dumb Friends League"
        address = "2080 S Quebec St"
        city = "Denver"
        state = "CO"
        zip = "80231"

        fill_in :name, with: name
        fill_in :address, with: address
        fill_in :city, with: city
        fill_in :state, with: state
        fill_in :zip, with: zip

        expect { click_button "Create Shelter" }.to change(Shelter, :count).by(1)
        expect(current_path).to eq(shelters_path)
        expect(page).to have_content(name)
      end
    end
  end
end

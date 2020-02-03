class SheltersPetsController < ApplicationController
  def index
     @shelter_id = params[:shelter_id]
     @shelter = Shelter.find(params[:shelter_id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = Pet.new(pet_params)
    pet.shelter = shelter

    pet.save!
    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  private
    def pet_params
      params.permit(:picture, :name, :description, :age, :sex, :adoption_status)
    end
end

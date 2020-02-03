class SheltersPetsController < ApplicationController
  def index
     @shelter_id = params[:shelter_id]
     @shelter = Shelter.find(params[:shelter_id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  private
    def pet_params
      params.permit(:picture, :name, :description, :age, :sex, :adoption_status)
    end
end

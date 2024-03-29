class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def index
    @pets = Pet.all
  end
  
  private

  def pet_params
    params.require(:pet).permit(:name, :photo)
  end
end

class PlacesController < ApplicationController
  def index
    @places = Place.all
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    
    if @place.save
      redirect_to places_path
    else
      render :index
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address)
  end
end

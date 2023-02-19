class TechnologiesController < ApplicationController
  def create
    @technology = Technology.new(technology_params)
    
    if @technology.save
      redirect_to root_path
    end
  end

  private

  def technology_params
    params.require(:technology).permit(:name, favourite_technology_attributes: [:touch, :_destroy])
  end
end

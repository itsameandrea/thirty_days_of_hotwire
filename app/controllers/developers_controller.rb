class DevelopersController < ApplicationController
  def show
    @developer = Developer.find(params[:id])
  end
end

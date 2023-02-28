module Onboarding
  class DeveloperInformationsController < ApplicationController
    def new
      @developer_information = DeveloperInformation.new
    end

    def create
      @developer_information = DeveloperInformation.new(developer_information_params)

      if @developer_information.valid?
        session[:developer_information] = {
          first_name: @developer_information.first_name,
          last_name: @developer_information.last_name,
          location: @developer_information.location,
          email: @developer_information.email
        }

        redirect_to new_onboarding_developer_skill_path
      else
        render :new
      end
    end

    private

    def developer_information_params
      params.require(:onboarding_developer_information).permit(
        :first_name,
        :last_name,
        :email,
        :location
      )
    end
  end
end


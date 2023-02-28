module Onboarding
  class DeveloperPreferencesController < ApplicationController
    def new
      @developer_preferences = DeveloperPreference.new
    end

    def create
      @developer_preferences = DeveloperPreference.new(developer_preferences_params)

      if @developer_preferences.valid?
        all_params = developer_preferences_params.merge(session[:developer_information])
          .merge(session[:developer_skills])
        
        developer = Developer.create!(all_params)

        session.delete('developer_information')
        session.delete('developer_skills')

        redirect_to developer_path(developer), notice: 'Developer was successfully created.'
      else
        render :new
      end
    end

    private

    def developer_preferences_params
      params.require(:onboarding_developer_preference).permit(
        :day_rate,
        :preferred_contract_duration
      )
    end
  end
end



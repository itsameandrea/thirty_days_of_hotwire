module Onboarding
  class DeveloperSkillsController < ApplicationController
    def new
      @developer_skills = DeveloperSkill.new
    end

    def create
      @developer_skills = DeveloperSkill.new(developer_skills_params)

      if @developer_skills.valid?
        session[:developer_skills] = {
          skills: @developer_skills.skills
        }

        redirect_to new_onboarding_developer_preference_path
      else
        render :new
      end
    end

    private

    def developer_skills_params
      params.require(:onboarding_developer_skill).permit(
        :skills
      )
    end
  end
end



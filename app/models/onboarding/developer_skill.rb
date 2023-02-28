module Onboarding
  class DeveloperSkill
    include ActiveModel::Model
    attr_accessor :skills

    validates :skills, presence: true
  end
end


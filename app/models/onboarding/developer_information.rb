module Onboarding
  class DeveloperInformation
    include ActiveModel::Model
    attr_accessor :first_name, :last_name, :location, :email

    validates :first_name, :last_name, :email, :location, presence: true
  end
end


module Onboarding
  class DeveloperPreference
    include ActiveModel::Model
    attr_accessor :day_rate, :preferred_contract_duration
    
    PREFERRED_CONTRACT_DURATION = ["1 month", "3 months", "6 months", "1 year"].freeze

    validates :day_rate, :preferred_contract_duration, presence: true
    validates :day_rate, numericality: { greater_than: 0 }
    validates :preferred_contract_duration, inclusion: { in: PREFERRED_CONTRACT_DURATION }
  end
end


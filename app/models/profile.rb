class Profile < ApplicationRecord
  belongs_to :job
  belongs_to :specialization
end

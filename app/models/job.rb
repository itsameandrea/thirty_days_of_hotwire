class Job < ApplicationRecord
  has_many :specializations

  accepts_nested_attributes_for :specializations, allow_destroy: true
end

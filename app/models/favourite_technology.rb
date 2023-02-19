class FavouriteTechnology < ApplicationRecord
  attr_accessor :touch

  belongs_to :technology
  delegate :name, to: :technology
end

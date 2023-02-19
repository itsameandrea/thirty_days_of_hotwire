class Technology < ApplicationRecord
  has_one :favourite_technology
  accepts_nested_attributes_for :favourite_technology, allow_destroy: true

  scope :by_name, -> (name) { where("name ILIKE ?", "%#{name}%") }

  def self.search(params)
    technologies = all
    technologies = technologies.by_name(params[:query]) if params[:query].present?
    technologies = technologies.where.not(id: FavouriteTechnology.pluck(:technology_id))

    technologies
  end
end

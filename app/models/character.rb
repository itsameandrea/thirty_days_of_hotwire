class Character < ApplicationRecord
  scope :by_name, -> (name) { where('name ILIKE ?', "%#{name}%") }
  scope :by_species, -> (species) { where species: species }
  scope :by_homeworld, -> (homeworld) { where homeworld: homeworld }
  scope :by_affiliation, -> (affiliation) { where affiliation: affiliation }

  def self.search(params)
    characters = where(nil)

    characters = characters.by_name(params[:name]) if params[:name].present?
    characters = characters.by_species(params[:species]) if params[:species].present?
    characters = characters.by_homeworld(params[:homeworlds]) if params[:homeworlds].present?
    characters = characters.by_affiliation(params[:affiliations]) if params[:affiliations].present?

    characters
  end
end


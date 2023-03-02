class Command < ApplicationRecord
  scope :by_name, -> (query) { where("name LIKE ?", "%#{query}%") }

  def self.search(params)
    commands = where(nil)
    commands = commands.by_name(params[:query])
    commands
  end
end

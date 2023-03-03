class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def as_marker
    { lat: latitude, lng: longitude }
  end
end


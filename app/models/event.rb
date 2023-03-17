class Event < ApplicationRecord
  default_scope { order(starting_at: :asc) }
end

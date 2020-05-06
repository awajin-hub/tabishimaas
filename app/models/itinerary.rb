class Itinerary < ApplicationRecord
  belongs_to :tour
  validates :depart_time, presence: true
  validates :depart_place, presence: true, length: { maximum: 255 }
  #validates :todo, presence; true
end

class ShortlistedActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :trip
  validates :trip, uniqueness: { scope: :activity }
end

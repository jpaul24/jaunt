class Review < ApplicationRecord
  RATING = [1, 2, 3, 4, 5]
  belongs_to :activity
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: RATING }
end

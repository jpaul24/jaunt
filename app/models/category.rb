class Category < ApplicationRecord
  has_many :activity_categories, dependent: :destroy
  has_many :activities, through: :activity_categories, dependent: :destroy
end

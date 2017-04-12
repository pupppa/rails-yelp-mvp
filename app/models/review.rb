class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, inclusion: { in: [1..5], allow_nil: false }
  validates :content, presence: true
  validates :rating, presence: true
end

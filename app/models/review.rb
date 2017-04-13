class Review < ApplicationRecord

  belongs_to :restaurant
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, lesser_than_or_equal_to: 5 }, presence: true
  validates :content, presence: true

end

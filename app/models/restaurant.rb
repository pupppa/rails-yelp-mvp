class Restaurant < ApplicationRecord
  CATEGORIES = %w(chinese italian french belgian japanese)

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  def rating
    reviews.average(:rating)
  end



end

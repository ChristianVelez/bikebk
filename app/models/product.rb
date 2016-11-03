class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, presence: true
  validates :price, presence: true
  validates :color, presence: true

  def average_rating
    comments.average(:rating).to_f
  end
end

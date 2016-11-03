class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
    #validates :user #uniqueness: { scope: :comment,
    #message: "should happen once per year" }
    validates :user, presence: true
    validates :product, presence: true
    validates :rating, numericality: { only_integer: true }

end

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :votes
  has_many :works, through: :votes
end

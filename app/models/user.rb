class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :vote
  has_many :works, through: :votes
end

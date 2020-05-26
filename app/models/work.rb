class Work < ApplicationRecord
  validates :title, presence: true

  has_many :votes
  has_many :users, through: :votes 

  def self.albums
    Work.where(category: "album")
  end

  def self.movies  # less efficient 
    Work.all.find_all do|work|
      work.category == "movie"
    end
  end

  def self.books
    Work.where(category: "book")
  end

  def self.top_works(category)
    where(category: category).sort{|a, b| b.votes.count <=> a.votes.count}.first(10)
  end

  def self.spotlight
    all.sort{|a, b| b.votes.count <=> a.votes.count}.first

  end
end

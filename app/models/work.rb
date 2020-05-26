class Work < ApplicationRecord
  validates :title, presence: true

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

end

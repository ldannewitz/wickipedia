class Category < ActiveRecord::Base
  has_many :articles

  def published_articles
    self.articles.where(published: true)
  end

  def self.matched_categories(search_term)
    search_term = search_term.downcase
    where("lower(name) = ?", search_term)
  end
end

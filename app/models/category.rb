class Category < ActiveRecord::Base
  has_many :articles

  def published_articles
    self.articles.where(published: true)
  end

  def self.matched_categories(search_term)
    search_term = search_term.downcase
    self.where("lower(name) LIKE ?", "%#{search_term}%" )
  end
end

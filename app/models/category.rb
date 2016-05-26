class Category < ActiveRecord::Base
  has_many :articles

  def self.matched_categories(search_term)
    matches = self.where("lower(name) LIKE ?", "%#{search_term.downcase}%")
  end
end

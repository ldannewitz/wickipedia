class Category < ActiveRecord::Base
  has_many :articles

  def published
    self.articles.where(published: true)
  end
end

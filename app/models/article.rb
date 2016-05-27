class Article < ActiveRecord::Base
  belongs_to :category
  has_many :sources
  has_many :edits
  has_many :editors, through: :edits
  has_many :comments
  has_many :commenters, through: :comments
  validates :title, :category_id, presence:true


  def feature
    self.update_attribute(:featured, true) if self.published
  end

  def unfeature
    self.update_attribute(:featured, false) if self.featured
  end

  def publish
    self.update_attribute(:published, true)
  end

  def unpublish
    self.update_attribute(:published, false)
  end

  def self.matched_articles(search_term)
    matches = []

    self.all.each do |article|
      if article.title.downcase.include?(search_term.downcase)
        matches << article
      elsif article.edits.last.content.downcase.include?(search_term.downcase)
        matches << article
      end
    end
    matches
  end
end

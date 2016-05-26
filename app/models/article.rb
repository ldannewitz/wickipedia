class Article < ActiveRecord::Base
  belongs_to :category
  has_many :edits
  has_many :editors, through: :edits
  has_many :comments
  has_many :commenters, through: :comments
  validates :title, :category_id, presence:true


  def feature
    if self.published
      self.featured = true
      self.save
    end
    # self
  end

  def publish
    unless self.published
      self.published = true
      self.save
    end
    # self
  end

  def unpublish
    if self.published
      self.published = false
      self.save
    end
    # self
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

class Article < ActiveRecord::Base
  belongs_to :category
  has_many :edits
  has_many :editors, through: :edits
  has_many :comments
  has_many :commenters, through: :comments
  validates :title, :category_id, presence:true


  def feature
    update_attribute(:featured, true) if self.published
  end

  def unfeature
    update_attribute(:featured, false) if self.featured
  end

  def publish
    update_attribute(:published, true)
  end

  def unpublish
    update_attribute(:published, false)
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
    matches = matches.sort{|a,b| a.title <=> b.title}
  end
end

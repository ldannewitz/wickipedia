class Article < ActiveRecord::Base
  belongs_to :category
  has_many :sources
  has_many :edits
  has_many :editors, through: :edits
  has_many :comments
  has_many :commenters, through: :comments
  validates :title, :category_id, presence:true

  def self.matched_articles(search_term)
    matches = []
    # matches << Article.where("lower(title) LIKE ?", "%#{params[:search].downcase}%")
    # matches << Article.where("lower(title) LIKE ?", "%#{params[:search].downcase}%")

    self.all.each do |article|
      if article.title.downcase.include?(search_term.downcase)
        matches << article
      elsif article.edits.last.content.downcase.include?(search_term.downcase)
        matches << article
      end
      matches
    end
  end
end

class Article < ActiveRecord::Base
  belongs_to :category
  has_many :sources
  has_many :edits
  has_many :editors, through: :edits
  has_many :comments
  has_many :commenters, through: :comments
end

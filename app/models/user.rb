class User < ActiveRecord::Base
  has_secure_password
  has_many :comments, foreign_key: :commenter_id
  has_many :commented_articles, through: :comments
  has_many :edits, foreign_key: :editor_id
  has_many :editted_articles, through: :edits
end

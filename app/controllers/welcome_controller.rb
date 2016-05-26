class WelcomeController < ApplicationController
  def index
    @featured_articles = Article.where(featured: true)
  end
end

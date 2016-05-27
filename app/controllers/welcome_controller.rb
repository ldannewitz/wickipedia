class WelcomeController < ApplicationController
  def index
    @featured_articles = Article.where(featured: true, published: true)
  end
end

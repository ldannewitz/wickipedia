class SearchController < ApplicationController
  def index
    @articles = Article.matched_articles(params[:term])
    @categories = Category.matched_categories(params[:term])
  end
end

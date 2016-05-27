class SearchController < ApplicationController
	include ApplicationHelper
  def index
    url = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyAbrYXoujtWWVTmnqkAVsiN96ikDRqioQg'


    articles = Article.matched_articles(params[:term])
    @articles = user_signed_in? ? articles : articles.select(&:published)
    @categories = Category.matched_categories(params[:term])
  end
end

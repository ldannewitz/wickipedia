require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
    it "assigns @featured_articles" do
      get :index
      featured_articles = Article.where(featured: true)
      expect(assigns(:featured_articles)).to eq(featured_articles)
    end
  end
end

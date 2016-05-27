require 'rails_helper'

describe WelcomeController do
	let!(:featured_articles) { Article.where(featured: true, published: true) }

  describe "GET index" do
    it "assigns @featured_articles" do
      get :index
      expect(assigns(:featured_articles).count).to eq(featured_articles.count)
    end
  end
end

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "GET index" do
    it "assigns @article" do
      birthday = Category.create!(name: 'Birthday')
      article = Article.create!(title: 'Roman candle battle in Chicago', category: birthday )
      # p a_category_path(category.name)
      get :index, { category: birthday.name, id: article.id }
      expect(assigns(:article)).to eq(article)
    end
  end
end

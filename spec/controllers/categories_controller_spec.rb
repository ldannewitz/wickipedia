require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET show" do
    it "assigns @category" do
      category = Category.create!(name: 'Birthday')
      # p a_category_path(category.name)
      get :show, { category: category.name }
      expect(assigns(:category)).to eq(category)
    end
  end
end

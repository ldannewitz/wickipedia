class ArticlesController < ApplicationController
  include ApplicationHelper

 def show
    @article = Article.find(params[:id])
    @category = @article.category
    if request.xhr?
      render '_show_partial', layout: false
    end
  end

  def new
    @article = Article.new
    @category = Category.new
    @categories = Category.all.map {|category| [category.name, category.id] }
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path(@article.category, @article)
    else
      render 'new'
    end
  end

  def edit
    authenticate_user!

    @article = Article.find(params[:id])
    if @article.edits.last == nil
      @last_edit = ""
    else
      @last_edit = @article.edits.last.content
    end
    @edit = Edit.new

    if request.xhr?
      render '_edit_partial', layout: false
    end
  end

  def update
    @article = Article.find(params[:id])
    @edit = Edit.new(edit_params.merge(article_id: params[:id], editor_id: session[:user_id]))
    @edit.find_differences(@article)
    if @edit.save
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    authenticate_user!
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end


  def show_revisions
    @article = Article.find(params[:id])
    @edits = @article.edits
  end

  def publish_article
    article = Article.find(params[:id])
    article.publish

    redirect_to articles_path(article.category, article)
  end

  def unpublish_article
    article = Article.find(params[:id])
    article.unpublish

    redirect_to articles_path(article.category, article)
  end

  def feature_article
    @article = Article.find(params[:id])
    @article.feature

    # ===========
    # articles = Article.where(published: true)
    # @article = articles.find(params[:id])

    # if @article.published
    #   @article.feature
    # end
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :category_id)
  end

  def edit_params
    params.require(:edit).permit(:content)
  end
end

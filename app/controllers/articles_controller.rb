class ArticlesController < ApplicationController

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
    @edit = Edit.new(edit_params.merge(article_id: params[:id], editor_id: session[:user_id]))
    if @edit.save
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  private
    def article_params
      params.require(:article).permit(:title, :category_id)
    end

    def edit_params
      params.require(:edit).permit(:content)
    end
end

class CommentsController < ApplicationController
  def index
    @article = Article.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params.merge(commenter_id: session[:user_id], article_id: params[:id]))

    if @comment.save
      redirect_to article_comments_path(params[:category],params[:id])
    else
      render 'index'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

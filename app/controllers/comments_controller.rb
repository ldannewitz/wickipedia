class CommentsController < ApplicationController
  def show
    @comments = Comment.all
  end
end

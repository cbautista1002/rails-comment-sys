class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new

  end

  def create
    # render plain: params[:comment].inspect
    @comment  = Comment.new(comment_params)
    @comment.save
    redirect_to @comment
  end

  private
    def comment_params
      params.require(:comment).permit(:text, :user_id)
    end

  def show
    render 'index'
  end

end

class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @parentId = params[:parentId]
  end

  def create
    # render plain: params[:comment].inspect
    # render plain: params
    @comment  = Comment.new(comment_params)
    @comment.save
    redirect_to @comment
  end

  private
    def comment_params
      @temp = params.require(:comment).permit(:text, :user_id)
      @temp[:parentId] = params[:parentId]
      return @temp
    end

  def show
    render 'index'
  end

end

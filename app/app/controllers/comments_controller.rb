class CommentsController < ApplicationController

  # Create data strutures that contains all comment info
  def index
    @parents_children = {}
    @all_comments = Comment.all

    @all_comments.each do |comment|
      @parents_children[comment.id] = {}
      @parents_children[comment.id][:self] = comment
      @parents_children[comment.id][:children] = []
      @children = Comment.where(parentId: comment.id)
      @children.each do |child|
        @parents_children[comment.id][:children].push(child.id)
      end
    end

    # Create starting list of comments - the first layer of comments
    @top_level = []
    Comment.where(parentId: nil).each do |c|
      @top_level.push(c.id)
    end

  end

  # Store parentId so that view can use it
  def new
    @parentId = params[:parentId]
  end

  # Create and save new comment, then redirect to comments page
  def create
    @comment  = Comment.new(comment_params)
    @comment.save
    redirect_to action: 'index'
  end

  # Show one comment's info
  def show
    @comment = Comment.find(params[:id])
  end

  private

  # Grab needed params and add parentId for later storage
  def comment_params
    @temp = params.require(:comment).permit(:text, :user_id)
    @temp[:parentId] = params[:parentId]
    return @temp
  end

end

class CommentsController < ApplicationController
  def index
      redirect_to root_path
  end

  def new
    @entry = Entry.find(params[:entry_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @entry = Entry.find(params[:comment][:entry_id])
    redirect_to @entry
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @entry = @comment.entry

    redirect_to( @entry )
  end

  private
  def comment_params
    params.require(:comment).permit(:commentContent, :entry_id)
  end

end
class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @commentable.save
    redirect_to @notable, notice: "Your comments was successfully posted..."
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end

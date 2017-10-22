class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @commentable.save
      redirect_to @commentable, notice: "Your comments was successfully posted..."
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end

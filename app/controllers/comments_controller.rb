class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    commentable = @commentable.try(:question) || @commentable
    if @comment.save
       redirect_to question_path(commentable), notice: "Your comment was posted successfully..."
    else
       redirect_to question_path(commentable), flash: { alert: "Your comment wasn't posted..." }
    end
  end

  def new
    @comment = Comment.new
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end

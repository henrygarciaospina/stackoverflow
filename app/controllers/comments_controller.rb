class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to root_path, notice: "Your comments was successfully posted..."
    else
      redirect_to root_path, notice: "Your comment wasn't posted!"
    end
  end

  def new
    @comment = Comment.new
  end

  private

    def comment_params
          params.require(:comment).permit(:body)
    end

    def set_commentable
      @commentable = Answer.find_by(params[:answer_id])
    end
end

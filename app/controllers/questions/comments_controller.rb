class Questions::CommentsController < CommentsController
  before_action :set_commentable

  def create
   super
  end

  private

    def set_commentable
      @commentable = Question.find(params[:question_id])
    end
end

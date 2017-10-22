class Answers::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
  end

  private

    def set_commentable
      @commentable = Answer.find(params[:answer_id])
    end
end

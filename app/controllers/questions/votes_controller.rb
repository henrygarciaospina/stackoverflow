class Questions::VotesController < VotesController
  before_action :set_voteable

  private

    def set_voteable
      @voteable = Question.find(params[:id])
    end
end

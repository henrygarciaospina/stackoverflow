class Answers::VotesController < VotesController
  before_action :set_voteable

  private

    def set_voteable
      @voteable = Answer.find(params[:id])
    end
end

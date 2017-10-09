class Votes::VotesController < VotesController
  before_action :set_voteable

  private

    def set_voteable
      @commentable = Vote.find(params[:vote_id])
    end
end

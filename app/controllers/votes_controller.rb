class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voteable, only: [:show, :edit, :update, :destroy]

  def create
    if same_user?
      flash[:error] = "You can't vote on your own posts"
    else
      @voteable.votes.create(user: current_user)
      flash[:notice] = "A successfully voted..."
    end
    redirect_to question_path(question)
  end

  def destroy
    @voteable.votes.where(user: current_user).take.try(:destroy)
    redirect_to question_path(question), notice: "Successfully removed vote..."
  end

  private

    def question
      @voteable.try(:question) || @voteable
    end

    def same_user?
      @voteable.user_id ==  current_user.id
    end
end

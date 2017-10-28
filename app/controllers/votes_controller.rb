class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voteable, only: [:show, :edit, :update, :destroy]

  def create
    @voteable.votes.create(user: current_user)
    redirect_to question_path(question), notice: "A successfully voted..."
  end

  def destroy
    @voteable.votes.where(user: current_user).take.try(:destroy)
    redirect_to question_path(question), notice: "Successfully removed vote..."
  end

  private

    def question
      @voteable.try(:question) || @voteable
    end
end

class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voteable, only: [:show, :edit, :update, :destroy]

  def create
    @voteable.votes.create(user: current_user)

    redirect_to root_path, notice: "A successfully voted for the question..."
  end

  def destroy
    @voteable.votes.where(user: current_user).take.try(:destroy)

    redirect_to root_path, notice: "Successfully removed question vote"
  end

end

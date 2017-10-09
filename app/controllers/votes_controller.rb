class VotesController < ApplicationController
  before_action :private_access, except: [:index, :show]
  before_action :set_voteable, only: [:show, :edit, :update, :destroy]

  def create
    @voteable.votes.create(user: current_user)

    redirect_to root_path
  end

  def destroy
    @voteable.votes.where(user: current_user).take.try(:destroy)
    redirect_to root_path
  end

end

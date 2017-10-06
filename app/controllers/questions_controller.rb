class QuestionsController < ApplicationController
  before_action :private_access, except: [:index, :show]
  before_action :find_quesion, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to root_path, notice: "The question has been successfully created"
    else
      render 'new'
    end
  end

  private
		def question_params
			params.require(:question).permit(:title, :body, :user_id)
		end

		def find_question
			@question = Question.find(params[:id])
		end
end

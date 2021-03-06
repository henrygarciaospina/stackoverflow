class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
    if params[:title].present?
      @questions = @questions.where("title LIKE ?", "%#{params[:title].capitalize}%").page(params[:page]).per(4)
    else
      @questions = Question.all.order("created_at DESC").page(params[:page]).per(4)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to root_path, notice: 'Question saved...'
    else
      redirect_to new_question_path, flash: { alert: 'question could not be announced...' } 
    end
  end

  def show
  end

  private

		def question_params
			params.require(:question).permit(:title, :body, :user_id)
		end

		def find_question
			@question = Question.find(params[:id])
		end
end

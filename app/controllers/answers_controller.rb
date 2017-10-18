class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_answer, only: [:show, :edit, :update, :destroy]
  before_action :current_question, only: [:show, :create]

  def new
    @answer = @question.answers.build
    render :layout => false
  end

  def create
    @answer = @question.answers.build(:user => current_user , :body => params[:body])
    if @answer.save
      redirect_to root_path, notice: 'Answer saved...'
    else
      flash.now[:alert] = 'Something went wrong...'
      render 'new'
    end
  end

  protected

  def record_not_found
    flash[:alert] = "The answer was not found..."
    redirect_to root_path
  end


  private

		def answer_params
			params.require(:answer).permit(:body, :user_id, :question_id)
		end

		def find_answer
			@answer = Answer.find(params[:id])
		end


		def current_question
			  @question = Question.find(params[:question_id])
		end



end

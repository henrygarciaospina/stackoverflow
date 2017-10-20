class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_answer, only: [:show, :edit, :update, :destroy]
  before_action :current_question, only: [:show, :create]

  def new
    @answer = @question.answers.build
    render :layout => false
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to question_path(@question), notice: 'Answer saved...'
    else
      flash[:alert] = 'Something went wrong...'
      redirect_to question_path(@question)
    end
  end
  
  private

		def answer_params
			params.require(:answer).permit(:body)
		end

		def find_answer
			@answer = Answer.find(params[:id])
		end


		def current_question
			  @question = Question.find(params[:question_id])
		end

end

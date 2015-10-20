class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to question_path
  end


  private
    def answer_params
      params.require(:answer).permit(:body, :user_id)
    end
end

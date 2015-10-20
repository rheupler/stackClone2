class QuestionsController < ApplicationController
  def index
    @questions = Question.where(updated_at: (Time.now - 24.hours)..Time.now)
    @users = User.all
  end

  def all_questions
    @questions = Question.all
  end

  def new
    @question = Question.new
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @questions = Question.all
    @answers = @question.answers.all
    # @answer = Answer.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end


private
  def question_params
    params.require(:question).permit(:title, :content)
  end


end

class QuizzesController < ApplicationController
  def new
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    quiz = Quiz.create(name: params[:name], subject: params[:subject], description: params[:description], user: current_user)

    redirect_to new_quiz_question_path(quiz.id)
  end

  def update
    quiz = Quiz.update(params[:id], quiz_params)

    redirect_to "/quizzes/#{quiz.id}"
  end

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.destroy

    redirect_to '/dashboard'
  end

  private

  def quiz_params
    params.permit(:name, :subject, :description)
  end
end

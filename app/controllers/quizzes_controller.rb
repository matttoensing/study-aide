class QuizzesController < ApplicationController
  def new
  end

  def create
    quiz = Quiz.create(name: params[:name], subject: params[:subject], description: params[:description], user: current_user)

    redirect_to new_quiz_question_path(quiz.id)
  end

  # private
  #
  # def quiz_params
  #   params.permit(:name, :subject, :description)
  # end
end

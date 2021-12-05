class AnswersController < ApplicationController
  def update
    answer = Answer.update(params[:id], answer_params)
    quiz = answer.question.quiz

    redirect_to "/quizzes/#{quiz.id}/questions/new"
  end

  private

  def answer_params
    params.permit(:answer, :question_id)
  end
end

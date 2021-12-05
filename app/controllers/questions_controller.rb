class QuestionsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
  end

  def create
    quiz = Quiz.find(params[:quiz_id])
    question = quiz.questions.create(questions_params)
    Answer.create(answer: params[:answer], question: question)

    redirect_to "/quizzes/#{quiz.id}/questions/new"
  end

  private

  def questions_params
    params.permit(:question, :quiz_id)
  end
end

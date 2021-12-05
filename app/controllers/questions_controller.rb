class QuestionsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    if edit_params_and_question_present?
      @question = Question.find(params[:question_id])
    elsif edit_params_and_answer_present?
      @answer = Answer.find(params[:answer_id])
    end
  end

  def create
    quiz = Quiz.find(params[:quiz_id])
    question = quiz.questions.create(questions_params)
    Answer.create(answer: params[:answer], question: question)

    redirect_to "/quizzes/#{quiz.id}/questions/new"
  end

  def update
    Question.update(params[:id], questions_params)

    redirect_to "/quizzes/#{params[:quiz_id]}/questions/new"
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    redirect_to "/quizzes/#{params[:quiz_id]}/questions/new"
  end

  private

  def questions_params
    params.permit(:question, :quiz_id)
  end

  def edit_params_and_question_present?
    params[:edit] && params[:question_id]
  end

  def edit_params_and_answer_present?
    params[:edit] && params[:answer_id]
  end
end

class AssessmentsController < ApplicationController
  def show
    params[:question] = 1
    @assessment = Assessment.find(params[:id])
  end

  def create
    quiz = Quiz.find(params[:quiz_id])
    assessment = Assessment.create(score: 0, number_of_questions: quiz.questions.count, time: Time.now, quiz: quiz, user_id: params[:user_id])

    redirect_to "/assessments/#{assessment.id}"
  end
end

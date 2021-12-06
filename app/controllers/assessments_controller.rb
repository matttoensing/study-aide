class AssessmentsController < ApplicationController
  def show
    @assessment = Assessment.find(params[:id])
    @question = @assessment.questions[params[:question].to_i]
    @question_num = params[:question].to_i + 1
  end

  def create
    quiz = Quiz.find(params[:quiz_id])
    assessment = Assessment.create(score: 0, number_of_questions: quiz.questions.count, time: Time.now, quiz: quiz, user_id: params[:user_id])

    redirect_to "/assessments/#{assessment.id}?question=0"
  end
end

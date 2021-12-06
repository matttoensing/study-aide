class AssessmentsController < ApplicationController
  def show
    @assessment = Assessment.find(params[:id])
    @question = @assessment.questions[params[:question].to_i]
    @question_num = params[:question].to_i + 1
  end

  def create
    quiz = Quiz.find(params[:quiz_id])
    assessment = Assessment.create(score: 0, number_of_questions: quiz.questions.count, starting_time: Time.now, quiz: quiz, user_id: params[:user_id])

    redirect_to "/assessments/#{assessment.id}?question=0"
  end

  def update
    assessment = Assessment.find(params[:id])

    if params[:answer] == 'correct'
      assessment.update(score: assessment.score += 1)
    end

    if params[:assessment]
      assessment.update(finishing_time: Time.now)
      assessment.finish_assessment

      flash[:success] = "You Scored #{assessment.score} out of #{assessment.number_of_questions} in #{assessment.completed_time} seconds"
      redirect_to '/dashboard'
    else
      redirect_to "/assessments/#{assessment.id}?question=#{(params[:question].to_i + 1)}"
    end
  end
end

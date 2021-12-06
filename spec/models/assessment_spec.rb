require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:quiz) }
    it { should have_many(:questions).through(:quiz) }
    it { should have_many(:answers).through(:quiz) }
  end

  describe 'validations' do
    it { should define_enum_for(:status).with(['in-progress', :completed, :cancelled]) }
  end

  describe 'instance methods' do
    describe '::finish_assessment' do
      it 'can update time when assessment is completed' do
        user = create(:user)
        quiz = create(:quiz, user: user)
        assessment = create(:assessment, starting_time: 120.seconds.ago, finishing_time: 10.seconds.ago, quiz: quiz, user: user)

        assessment_time = 110.seconds.ago
        time_today = "Sat, 01 Jan 2000 18:15:48 UTC +00:00".to_time

        allow(Time).to receive(:now).and_return(assessment_time)
        allow(Time).to receive(:at).and_return(assessment_time)

        assessment.finish_assessment
require "pry"; binding.pry
        expect(assessment.completed_time).to eq(Time.at(assessment_time))
      end
    end
  end
end

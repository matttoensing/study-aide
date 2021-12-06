require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:quiz) }
    it { should have_many(:questions).through(:quiz) }
    it { should have_many(:answers).through(:quiz) }
  end
end

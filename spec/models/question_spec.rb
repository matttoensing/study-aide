require 'rails_helper'

RSpec.describe Question do
  describe 'relationships' do
    it { should belong_to(:quiz) }
    it { should have_one(:answer) }
  end
end

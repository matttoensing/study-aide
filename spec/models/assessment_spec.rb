require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:quiz) }
  end
end

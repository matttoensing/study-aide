require 'rails_helper'

RSpec.describe Quiz do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:questions) }
  end
end

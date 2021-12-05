require 'rails_helper'

RSpec.describe Answer do
  describe 'relationships' do
    it { should belong_to(:question) }
  end
end

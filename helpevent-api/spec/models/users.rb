require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    let(:user_invalid_params) { FactoryBot.build(:user, :with_invalid_attributes) }
    
    context 'when attributes not avaliable' do
      it 'email not uniqueness' do
        debugger
      end
    end
  end
end

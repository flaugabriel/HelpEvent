require 'rails_helper'

RSpec.describe Api::V1::MyaccountController, type: :request do
  describe 'GET #profile' do
    context 'when user is authenticated' do
      before do
        @current_user = FactoryBot.create(:user)
      end

      it 'return the current user and status 200' do
        login
        get api_myaccount_profile_path
        debugger
      end
    end

    context 'when user is not authenticated' do
      it 'not return current user and status 401' do
        get api_myaccount_profile_path
        expect(response.status).to eq(401)
      end
    end
  end
end

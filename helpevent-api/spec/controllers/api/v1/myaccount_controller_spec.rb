require 'rails_helper'

RSpec.describe Api::V1::MyaccountController, type: :request do
  let(:user) { create :user }
  let(:valid_headers) do
    user.create_new_auth_token.merge('Accept' => 'application/app.helpevent.com') 
  end
  let(:invalid_headers) do
    {'Accept' => 'application/app.helpevent.com'} 
  end

  describe 'GET #profile' do
    context 'when user is authenticated' do
      it 'return the current user and status 200' do
        get api_myaccount_profile_path, headers: valid_headers
        expect(json['data']['nickname']).to eq('test') 
        expect(response.status).to eq(200)  
      end
    end

    context 'when user is not authenticated' do
      it 'not return current user and status 401' do
        get api_myaccount_profile_path, headers: invalid_headers
        expect(response.status).to eq(401)
      end
    end
  end
end

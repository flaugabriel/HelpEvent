require 'rails_helper'


RSpec.describe Api::V1::UsersController, type: :request do
  let(:user) { create :user }
  let(:valid_headers) do
    user.create_new_auth_token.merge('Accept' => 'application/app.helpevent.com') 
  end
  let(:invalid_headers) do
    {'Accept' => 'application/app.helpevent.com'} 
  end

  describe "GET #show" do
    context "when user exist " do
      it "returns a user and success response status 200" do
        get api_users_show_path, params: { id: user.id }, headers: valid_headers
        expect(json['id']).to eq(user.id) 
        expect(response.status).to eq(200)  
      end
    end

    context 'when user not exist' do
      it 'not return a user and response status 200' do
        get api_users_show_path, params: { id: nil }, headers: valid_headers
        expect(json['messenger']).to eq('Perfil não encontrado!') 
        expect(json['status']).to eq('not_found') 
        expect(response.status).to eq(200)  
      end
    end
  end
end

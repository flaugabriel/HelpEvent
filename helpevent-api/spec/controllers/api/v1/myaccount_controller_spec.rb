require 'rails_helper'


RSpec.describe Api::V1::MyaccountController, type: :controller do
  describe "GET #profile" do
    context "when user is authenticated" do
      let(:user) { FactoryBot.create(:user) }

      before do
        @auth_headers = user.create_new_auth_token
        request.headers.merge!(@auth_headers)
      end

      it 'does something' do
        get :profile
        debugger
      end
    end

    context "when user is not authenticated" do
      it 'does something' do

      end
    end
  end
end

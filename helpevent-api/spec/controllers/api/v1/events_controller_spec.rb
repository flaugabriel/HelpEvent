require 'rails_helper'

RSpec.describe Api::V1::EventsController , type: :controller do
  describe 'GET #index' do
    context "when user is connected" do
      let(:user) { FactoryBot.create(:user) }
      before do
        sign_in user
        get :index
      end

      it 'returns a success response' do
        events = FactoryBot.create_list(:event, 50)

        debugger
        # expect(response).to be_successful
      end
    end

    context 'quando o usuário não está autenticado' do
      it 'deve retornar o status 401 Unauthorized' do
        get :show, params: { id: my_model.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      event = Event.create! valid_attributes
      get :show, params: {id: event.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it "creates a new Event" do
        expect {
          post :create, params: {event: valid_attributes}, session: valid_session
        }.to change(Event, :count).by(1)
      end

      it "renders a JSON response with the new event" do

        post :create, params: {event: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(event_url(Event.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new event" do

        post :create, params: {event: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested event" do
        event = Event.create! valid_attributes
        put :update, params: {id: event.to_param, event: new_attributes}, session: valid_session
        event.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the event" do
        event = Event.create! valid_attributes

        put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the event" do
        event = Event.create! valid_attributes

        put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, params: {id: event.to_param}, session: valid_session
      }.to change(Event, :count).by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_valid_params) { FactoryBot.build(:user) }

  describe 'validates' do
    let(:user_invalid_params) { FactoryBot.build(:user, :with_invalid_attributes) }
    
    context 'when attributes not avaliable' do
      it 'all params is invalid' do
        user_invalid_params.save
        expect(user_invalid_params.valid?).to eq(false)  
      end

      it 'email and nickname not uniqueness' do
        user_invalid_params.validate
        expect(user_invalid_params.errors[:email].first).to eq("can't be blank") 
        expect(user_invalid_params.errors[:nickname].first).to eq(nil) 
      end
    end

    context 'when attributes is valiable' do
      it 'all params is valid' do
        user_invalid_params.save
        expect(user_valid_params.valid?).to eq(true)  
      end
    end
  end

  describe "belongs_to" do
    let(:user_with_events) { FactoryBot.create(:user_with_events) }

    context "when exist events" do
      it "return five events" do
        expect(user_with_events.events.present?).to eq(true)  
        expect(user_with_events.events.count).to eq(5)  
      end
    end

    context "when not exist events" do
      it "not return event by user" do
        expect(user_valid_params.events.present?).to eq(false)  
      end
    end
  end
  
end

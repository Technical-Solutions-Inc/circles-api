require 'rails_helper'

RSpec.describe EventsController do
  describe "index" do
    context "when no pagination is passed" do
      let(:users) { create_list(:user, 3) }
      let(:events) { create_list(:event, 2, users: users) }
      let(:expected_payload) do
        {
          
        }
      end

      it 'returns the expected payload' do
        get :index, user_id: user.id
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_payload)
      end
    end
  end
end
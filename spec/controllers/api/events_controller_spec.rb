require 'rails_helper'

describe API::EventsController do
  describe "index" do
    context "when no pagination is passed" do
      let!(:users) { create_list(:user, 3) }
      let!(:user) { create(:user) }
      let!(:events) { create_list(:event, 2) }
      let(:expected_payload) { EventIconBuilder.new(user_id: user.id).build_payload.to_json }

      # Builds Event Memberships
      before do
        events.each do |event|
          event.add_members(members: users.last(rand(users.length)))
          # Ensure our main user is on all these events
          event.add_members(members: [user])
        end
      end

      it 'returns the expected payload' do
        get :index, user_id: user.id
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_payload)
      end
    end

    context "when pagination is passed" do
      let!(:users) { create_list(:user, 5) }
      let!(:user) { create(:user) }
      let!(:events) { create_list(:event, 60) }
      let(:start_id) { 10 }
      let(:count) { 50 }
      let(:expected_payload) do 
        EventIconBuilder.new(user_id: user.id, start_id: start_id, count: count).build_payload.to_json
      end

      # Builds Event Memberships
      before do
        events.each do |event|
          event.add_members(members: users.last(rand(users.length)))
          # Ensure our main user is on all these events
          event.add_members(members: [user])
        end
      end

      it 'returns the expected payload' do
        get :index, user_id: user.id, start_id: start_id, count: count
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_payload)
        expect(JSON.parse(response.body)["events"].count).to eq(count)
      end
    end
  end
end
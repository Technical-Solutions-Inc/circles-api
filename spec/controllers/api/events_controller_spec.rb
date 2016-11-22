require 'rails_helper'

describe Api::EventsController do
  render_views

  let(:parsed_response) { JSON.parse(response.body) }

  describe "index" do
    let(:expected_event_keys) { %w(id name startDate endDate imageUrl members) }

    context "when user_id param is missing" do
      let(:missing_message) do
        "The following param(s) are required but were not found: user_id"
      end

      it "returns error with missing param" do
        get :index
        expect(response.status).to eq(404)
        expect(parsed_response.keys).to include("error")
        expect(parsed_response.values).to include(missing_message)
      end
    end

    context "when no pagination is passed" do
      let!(:users) { create_list(:user, 3) }
      let!(:user) { create(:user) }
      let!(:events) { create_list(:event, 2) }

      # Builds Event Memberships
      before do
        events.each do |event|
          event.add_members(members: users.last(rand(users.length)))
          # Ensure our main user is on all these events
          event.add_members(members: [user])
        end
      end

      it 'returns the expected payload' do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(200)
        expect(parsed_response.keys).to include("events")
        expect(parsed_response["events"].length).to eq(events.length)
        parsed_response["events"].each do |event|
          expect(event.keys).to eq(expected_event_keys)
        end
      end
    end

    context "when pagination is passed" do
      let!(:users) { create_list(:user, 5) }
      let!(:user) { create(:user) }
      let!(:events) { create_list(:event, 60) }
      let(:default_count) { 20 }

      # Builds Event Memberships
      before do
        events.each do |event|
          event.add_members(members: users.last(rand(users.length)))
          # Ensure our main user is on all these events
          event.add_members(members: [user])
        end
      end

      it 'returns the expected payload' do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(200)
        expect(parsed_response.keys).to include("events")
        expect(parsed_response["events"].length).to eq(default_count)
        parsed_response["events"].each do |event|
          expect(event.keys).to eq(expected_event_keys)
        end
      end
    end
  end
end
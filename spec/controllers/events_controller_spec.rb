require 'rails_helper'

RSpec.describe EventsController do
  it 'returns .ping_answer' do
    get :ping
    expect(response.body).to eq(expected_ping_answer)
  end
end
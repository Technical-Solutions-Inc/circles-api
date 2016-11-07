require 'rails_helper'

RSpec.describe PingsController do
  let(:expected_ping_answer) { {ping: described_class.new.send(:ping_answer)}.to_json }

  it 'returns .ping_answer' do
    get :ping
    expect(response.body).to eq(expected_ping_answer)
  end
end
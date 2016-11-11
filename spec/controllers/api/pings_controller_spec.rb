require 'rails_helper'

describe API::PingsController do
  describe 'GET ping' do
    let(:expected_ping_answer) { {ping: described_class.new.send(:ping_answer)}.to_json }
  
    it 'returns .ping_answer' do
      get :ping
      expect(response.body).to eq(expected_ping_answer)
    end
  end
end
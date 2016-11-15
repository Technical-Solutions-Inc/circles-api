class Api::PingsController < ApplicationController
  def ping
    render json: {ping: ping_answer}
  end

  private

  def ping_answer
    "pong"
  end
end

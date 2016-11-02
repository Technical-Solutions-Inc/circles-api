class PingsController < ApplicationController
  def ping
    render json: {ping: "pongy pong"}
  end
end
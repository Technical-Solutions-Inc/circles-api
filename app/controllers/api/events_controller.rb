class Api::EventsController < ApplicationController
  def index
    events = EventIconBuilder.new(user_id: params[:user_id], start_id: params[:start_id], count: params[:count])
    render json: events.build_payload
  end
end

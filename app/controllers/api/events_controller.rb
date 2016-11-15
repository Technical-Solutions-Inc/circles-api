class API::EventsController < ApplicationController
  DEFAULT_COUNT = 20

  def index
    events = Event.where(user_id: params[:user_id]).offset(params[:start_id].to_i).limit(params[:count] || DEFAULT_COUNT)
    render json: events
  end
end
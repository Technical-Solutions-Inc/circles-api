class Api::EventsController < ApplicationController
  DEFAULT_COUNT = 20

  def index
    render json: events
  end

  private 

  def events
    User.find(params[:user_id]).events.offset(params[:start_id].to_i).limit(params[:count] || DEFAULT_COUNT)
  end
end

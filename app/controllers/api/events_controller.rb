class Api::EventsController < ApplicationController
  def index
    render json: events
  end

  private 

  def events
    User.find(params[:user_id]).events.offset(start_id).limit(count)
  end

  def default_count
    20
  end
end

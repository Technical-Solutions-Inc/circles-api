class Api::EventsController < ApplicationController
  def index
    @events = events
  end

  private 

  def events
    User.find(params[:user_id]).events.offset(start_id).limit(count)
  end

  def default_count
    20
  end

  def start_id
    params[:start_id].to_i
  end

  def count
    params[:count] || default_count
  end
end

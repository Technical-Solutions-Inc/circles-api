class Api::EventsController < ApplicationController
  expose :events, :get_events

  def required_params
    %w(user_id)
  end

  def get_events
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

class Api::EventsController < ApplicationController
  expose :events, :get_events

  def required_params
    %w(user_id)
  end

  def get_events
    # Do not remove the "includes". This allows us to eager load the
    # users association for each event.  Thereby avoiding
    # the n+1 query problem because of the JBuilder view where
    # each event is iterated over and the associated users (members)
    # are included in the response payload.
    User.find(params[:user_id]).events.includes(:users).offset(start_id).limit(count)
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

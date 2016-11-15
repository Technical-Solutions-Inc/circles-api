class ApplicationController < ActionController::API
  include ActionController::Serialization

  def start_id
    params[:start_id].to_i
  end

  def count
    params[:count] || DEFAULT_COUNT
  end
end

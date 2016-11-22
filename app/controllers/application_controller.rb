class ApplicationController < ActionController::API
  class RequiredParams < StandardError; end
  
  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    render json: { error: exception }, status: 403
  end

  # The follow section of the ApplicationController is for checking
  # the required parameters for a given controller.  To add a new
  # controller and require params for that controller,
  # just create a method named "required_params", like below,
  # and fill it with an array of the params that need to be checked
  # for non-nil values.

  before_filter :check_required_params

  rescue_from 'RequiredParams' do |exception|
    render json: { error: exception }, status: 404
  end

  def check_required_params
    missing_params = required_params.select do |param|
      params[param.to_sym].nil?
    end
    unless missing_params.empty?
      raise RequiredParams, missing_params_message(missing_params: missing_params)
    end
  end

  def required_params
    []
  end

  def missing_params_message(missing_params:)
    "The following param(s) are required but were not found: #{missing_params.join(", ")}"
  end
end

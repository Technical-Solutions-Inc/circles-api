class ApplicationController < ActionController::API
  class RequiredParams::Missing < StandardError; end
  
  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    render json: exception, status: 403
  end

  # The follow section of the ApplicationController is for checking
  # the required parameters for a given controller.  To add a new
  # controller and require params for that controller,
  # just create a method named "required_params", like below,
  # and fill it with an array of the params that need to be checked
  # for non-nil values.

  rescue_from 'RequiredParams::Missing' do |exception|
    render json: exception, status: 400
  end

  def check_required_params
    required_params.select! do |param|
      params[param.to_sym].nil?
    end
    raise RequiredParams::Missing, missing_params_message(missing_params: required_params) unless required_params.empty?
  end

  def required_params
    []
  end

  def missing_params_message(missing_params:)
    "The following params are required but were not found: #{missing_params.join(", ")}"
  end
end

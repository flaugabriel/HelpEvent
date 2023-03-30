class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken

	before_action :configure_permitted_parameters, if: :devise_controller?

	def json_error_response(messenger, status)
    render json: { messenger: messenger, status: status }
  end

	protected

  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name nickname])
  end
end

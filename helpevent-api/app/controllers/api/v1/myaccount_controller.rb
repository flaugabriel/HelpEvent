class Api::V1::MyaccountController < ApiController
  def profile
    render json: { data: current_api_user }, status: :ok
  end
end
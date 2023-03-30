class Api::V1::MyaccountController < ApiController
  def profile
    render json: { data: current_user }, status: :ok
  end
end
class Api::V1::UsersController < ApiController
  before_action :set_user, only: %i[show]

  def show
    return json_error_response('Perfil não encontrado!', :not_found) unless @user.present?

    render json: @user, each_serializer: Api::V1::UserSerializer, status: :ok
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
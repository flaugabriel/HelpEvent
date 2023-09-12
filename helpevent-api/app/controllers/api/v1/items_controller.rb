class Api::V1::ItemsController < ApiController
  before_action :set_item, only: %i[show update destroy]
  before_action :merge_user_on_item_create, only: %i[create]

  def index
    item = Item.all.order('updated_at desc')

    return json_error_response('Itens não encontrado!', :not_found, 404) unless item.present?

    render json: item, each_serializer: Api::V1::ItemSerializer, status: :ok
  end

  def show
    return json_error_response('Item não encontrado!', :not_found, 404) unless @item.present?

    render json: @item, each_serializer: Api::V1::ItemSerializer, status: :ok
  end

  def create
    @item = Item.new(merge_user_on_item_create)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def merge_user_on_item_create
    item_params.merge(user_id: current_api_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :location, :user_id)
  end
end

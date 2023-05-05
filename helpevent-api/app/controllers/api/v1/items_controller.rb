class API::V1::ItemsController < ApiController
  before_action :set_item, only: %i[ show update destroy ]

  def index
    item = Item.all.order('updated_at desc')

    return json_error_response('Eventos não encontrado!', :not_found) unless item.present?

    render json: item, each_serializer: Api::V1::ItemSerializer, status: :ok
  end

  def show
    render json: @item
  end

  def create
    @item = Item.new(item_params)

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
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :location, :user_id)
    end
end

class Api::V1::EventsController < ApiController
  before_action :set_event, only: %i[show update destroy]
  before_action :merge_user_on_event_create, only: %i[create]

  def index
    events = Event.all.order('updated_at desc')

    return json_error_response('Eventos não encontrado!', :not_found, 404) unless events.present?

    render json: events, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  def show
    render json: @events, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  def create
    event = Event.new(merge_user_on_event_create)

    return json_error_response(event.errors.full_messages, :not_implemented, 501) unless event.save

    render json: event, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
     return json_error_response('Evento não removido!', :not_implemented, 501) unless @event.present?

    render json: @event, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  private

  def merge_user_on_event_create
    event_params.merge(user_id: current_api_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :total_price, :event_data, event_user_attributes: %w[user_id event_id])
  end
end

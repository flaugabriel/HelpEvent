class Api::V1::EventsController < ApiController
  before_action :set_event, only: %i[show update destroy]

  def index
    events = Event.all.order('updated_at desc')

    return json_error_response('Eventos não encontrado!', :not_found) unless events.present?

    render json: events, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  def show
    render json: @events, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  def create
    event = Event.new(event_params)

    if event.save
      render json: events, each_serializer: Api::V1::EventSerializer, status: :ok
    else
      json_error_response(event.errors.full_mensager, :not_found) unless events.present?
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :total_price, :event_data, event_user_attributes: %w[user_id event_id])
  end
end

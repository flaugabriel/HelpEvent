class Api::V1::EventsController <ApiController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    events = Event.all.order('updated_at desc')

    return json_error_response('Eventos não encontrado!', :not_found) unless events.present?

    render json: events, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  # GET /events/1
  def show
    render json: @events, each_serializer: Api::V1::EventSerializer, status: :ok
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: 
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :total_price, :event_data,  event_user_attributes: [:user_id, :event_id]))
    end
end

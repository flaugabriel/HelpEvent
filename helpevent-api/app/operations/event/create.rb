class Operation::Events:create < Command
  def initialize(event)
    @event = event
    @resource = nil
    @errors = []
  end

  def call

    result
  end

  private

  def event_created_successfully
  end

  def created_user
  end
end
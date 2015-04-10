class EventCodeRepository
  def initialize(adapter = Rails.application.config.data_adapter)
    @adapter = adapter
  end

  def get_codes
    EventCodeParser.new(@adapter.get_event_codes).codes.map do |code|
      Event.new(code)
    end
  end

  def get_code(id)
    get_codes.find { |code| code.id == id.to_i }
  end
end

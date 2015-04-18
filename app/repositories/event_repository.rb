class EventRepository
  def initialize(adapter = Rails.application.config.data_adapter)
    @adapter = adapter
  end

  def get_events(league_id, id)
    event_parser = EventParser.new(@adapter.get_events(league_id, id))

    event_parser.events.map do |event|
      Event.new(event)
    end
  end

  def get_touch_events(league_id, id)
    touch_event_parser = TouchEventParser.new(@adapter.get_touch_events(league_id, id))

    touch_event_parser.touch_events.map do |touch_event|
      TouchEvent.new(touch_event)
    end
  end

  def get_event(league_id, match_id, id)
    get_events(league_id, match_id).find { |event| event.sequence == id.to_i }
  end

end

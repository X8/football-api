class ReplayService
  def initialize(pusher_client, league_id, fixture_id)
    @pusher_client = pusher_client
    @league_id     = league_id
    @fixture_id    = fixture_id
  end

  def channel
    "match_#{@fixture_id}"
  end

  def current_event
    @current_event || events.first
  end

  def next_event
    events[events.index(current_event) + 1]
  end

  def time_to_wait
    next_event.time.to_i - current_event.time.to_i
  end

  def dispatch_event
    @pusher_client.trigger(channel, 'event', current_event.as_json)
    Rails.logger.info("Event published: #{current_event.as_json}")
    @current_event = next_event
  end

  def start_in_thread
    Thread.new { start }
  end

  def start
    loop do
      wait_time = time_to_wait
      dispatch_event
      sleep(wait_time)
      if next_event.nil?
        dispatch_event
        break
      end
    end
  end

  def events
    @events ||= EventRepository.new.get_events(@league_id, @fixture_id)
  end
end

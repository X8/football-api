class TouchEventParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def touch_events
    root.xpath('soccer-ifb-game/touches/touch').map do |event|
      {
        sequence:      event['sequence'],
        touch_type_id: event['touch-type-id'],
        name:          event['touch-type'],
        player: build_player(event),
        recipient_player: build_player(event, "recipient-"),
        time: {
          half: event['half'],
          minutes: event['minutes'],
          seconds: event['seconds'],
          additional_minutes: event['additional-minutes']
        },
        coordinates: {
          x: event['x-coord'],
          y: event['y-coord']
        },
        coordinates_end: {
          x: event['x-coord-end'],
          y: event['y-coord-end']
        }
      }
    end
  end

  private

  def root
    @parser.xpath('//sports-statistics/sports-play-by-play').first
  end

  def build_player(event, player_type = "")
    return nil if event["#{player_type}player-id"].blank?
    {
      id:         event["#{player_type}player-id"],
      first_name: event["#{player_type}first-name"],
      last_name:  event["#{player_type}last-name"]
    }
  end
end

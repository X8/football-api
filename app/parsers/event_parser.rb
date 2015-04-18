class EventParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def events
    root.xpath('soccer-ifb-game/plays/play').map do |event|
      {
        sequence: event['seq-number'],
        type_id:  event['event-number'],
        name:     event['event-text'],
        description: event['text'],
        score: {
          home: event['home-score'],
          away: event['away-score']
        },
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
        field_area: event['field-area'],
        offensive_player: build_player(event, 'offensive-player'),
        defensive_player: build_player(event, 'defensive-player'),
        assisting_player: build_player(event, 'assisting-player'),
        replaced_player:  build_player(event, 'replaced-player')
      }
    end
  end

  def league_id
    root.xpath('league').first['global-id']
  end

  private

  def root
    @parser.xpath('//sports-statistics/sports-play-by-play').first
  end

  def build_player(event, player_type)
    return nil if event["#{player_type}-id"].blank?
    {
      id:         event["#{player_type}-id"],
      first_name: event["#{player_type}-first-name"],
      last_name:  event["#{player_type}-last-name"]
    }
  end
end

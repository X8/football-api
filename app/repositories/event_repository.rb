class EventRepository
  def initialize(adapter = Rails.application.config.data_adapter)
    @adapter = adapter
  end

  def get_events(league_id, id)
    event_parser = EventParser.new(@adapter.get_events(league_id, id))

    event_parser.events.map do |event|
      Event.new(
        sequence:           event[:seq_number],
        type_id:            event[:event_number],
        name:               event[:event_text],
        player:             player(event_parser, event[:offensive_player_id].to_i),
        recipient_player:   player(event_parser, event[:defensive_player_id].to_i),
        time:               PointInGame.new(event),
        coordinates:        Coordinate.new(x: event[:x_coord], y: event[:y_coord]),
        score:              Score.new(home: event[:home_score], away: event[:away_score]),
        description:        event[:text],
        field_area:         event[:field_area]
      )
    end
  end

  def get_event(league_id, match_id, id)
    get_events(league_id, match_id).find { |event| event.sequence == id.to_i }
  end

  private

  def player(event_parser, id)
    players(event_parser).find { |player| player.id == id }
  end

  def players(event_parser)
    @players ||= home_team_players(event_parser) + away_team_players(event_parser)
  end

  def home_team_players(event_parser)
    @home_team_players ||= roster_repository.get_roster(event_parser.league_id, event_parser.home_team_id.to_i).players
  end

  def away_team_players(event_parser)
    away_team_players ||= roster_repository.get_roster(event_parser.league_id, event_parser.away_team_id.to_i).players
  end

  def roster_repository
    @roster_repository ||= RosterRepository.new(@adapter)
  end
end

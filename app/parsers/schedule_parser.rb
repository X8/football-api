class ScheduleParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def created_at
    DateParser.new(root).date
  end

  def version
    root.xpath('version').first['number']
  end

  def games
    root.xpath('soccer-ifb-schedule/game-schedule').map do |game|
      attributes = attributes_for_game(game)

      {
        id:           attributes["gamecode"]["global_code"],
        scheduled_at: DateParser.new(game).date,
        week:         attributes["week"]["week"],
        stadium:      attributes_for_stadium(game),
        status:       attributes_for_status(game),
        home_team:    attributes_for_team(game, "home_team"),
        away_team:    attributes_for_team(game, "visiting_team")
      }
    end
  end

  private

  def attributes_for_game(game)
    @attributes_for_game ||= Hash.from_xml(game.to_s)['game_schedule']
  end

  def attributes_for_stadium(game)
    attributes = attributes_for_game(game)["stadium"]

    {
      id:   attributes["id"],
      name: attributes["name"]
    }
  end

  def attributes_for_status(game)
    attributes = attributes_for_game(game)["status"]

    {
      id:   attributes["status_id"],
      name: attributes["status"]
    }
  end

  def attributes_for_team(game, side)
    team = attributes_for_game(game)[side]

    {
      id:             team["team_info"]["id"],
      name:           team["team_info"]["name"],
      abbreviation:   team["team_info"]["alias"],
      location:       team["team_info"]["location"],
      score:          team.fetch("outcome", {}).fetch("score", 0)
    }
  end

  def root
    @parser.xpath('//sports-statistics/sports-schedule').first
  end
end

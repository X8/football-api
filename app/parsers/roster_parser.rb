class RosterParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def created_at
    DateParser.new(root).date
  end

  def version
    root.xpath('version').first['number']
  end

  def teams
    root.xpath('ifb-soccer-roster/ifb-team-roster').map do |team|
      attributes = Hash.from_xml(team.to_s)['ifb_team_roster']

      attributes_for_team(attributes).merge(attributes_for_players(attributes))
    end
  end

  private

  def attributes_for_players(attributes)
    players = attributes['ifb_roster_player']

    players.map! do |player|
      name = player["name"]
      {
        id:          player["player_code"]["id"],
        first_name:  name["first_name"].presence || name["full_first"],
        last_name:   name["last_name"].presence  || name["full_last"],
        position:    player["player_position"]["english"],
        height:      player["height"]["inches"],
        weight:      player["weight"]["pounds"],
        birthdate:   player["birth_date"].symbolize_keys,
        birthplace:  player["birth_loc"].symbolize_keys,
        nationality: player["nationality"].symbolize_keys
      }
    end

    { players: players }
  end

  def attributes_for_team(attributes)
    team = attributes['team_info']
    {
      id:             team["id"],
      name:           team["name"].presence || team["display_name"],
      abbreviation:   team["alias"],
      location:       team["location"],
      score:          team.fetch("outcome", {}).fetch("score", 0)
    }
  end

  def root
    @parser.xpath('//sports-statistics/sports-roster').first
  end
end

class LeagueParser
  def initialize(file)
    @parser  = Nokogiri::XML(file.read)
  end

  def created_at
    DateTime.new(
      date['year'].to_i, date['month'].to_i,  date['date'].to_i,
      time['hour'].to_i, time['minute'].to_i, time['second'].to_i
    )
  end

  def version
    root.xpath('version').first['number']
  end

  def league
    convert(league_node)
  end

  def season
    convert(season_node)
  end

  def teams
    team_nodes.map { |team_node| convert(team_node) }
  end

  private

  def root
    @parser.xpath('//sports-statistics/sports-teams').first
  end

  def team_nodes
    root.xpath('ifb-soccer-teams/team-info')
  end

  def league_node
    root.xpath('league').first
  end

  def date
    root.xpath('date').first
  end

  def season_node
    root.xpath('season').first
  end

  def time
    root.xpath('time').first
  end

  def convert(node)
    node.to_h.map { |key, value| [key.gsub('-', '_'), value] }.to_h.with_indifferent_access
  end
end

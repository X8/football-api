class LeagueRepository
  def initialize(adapter = Rails.application.config.data_adapter)
    @adapter = adapter
  end

  def get_league(id)
    parser = TeamParser.new(@adapter.get_league(id))
    League.new(attributes_for(parser.league))
  end

  def get_leagues
    @adapter.get_leagues.map do |league|
      parser = TeamParser.new(league)
      League.new(attributes_for(parser.league))
    end
  end

  private

  def attributes_for(league)
    {
      id:    league[:global_id],
      name:  league[:name],
      alias: league[:alias]
    }
  end
end

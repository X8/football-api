class RosterRepository
  def initialize(adapter = Rails.application.config.data_adapter)
    @adapter = adapter
  end

  def get_rosters(league_id)
    parser = RosterParser.new(@adapter.get_roster(league_id))
    parser.rosters.map { |roster| Roster.new(roster) }
  end

  def get_roster(league_id, id)
    get_rosters(league_id).find { |roster| roster.team.id == id.to_i }
  end
end


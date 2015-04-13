class FixtureRepository
  def initialize(adapter = Rails.application.config.data_adapter)
    @adapter = adapter
  end

  def get_fixtures(id)
    schedule_parser = ScheduleParser.new(@adapter.get_schedule(id))
    fixtures = schedule_parser.games.map { |game| Fixture.new(attributes_for(game)) }
  end

  def get_fixture(league_id, id)
    get_fixtures(league_id).find { |fixture| fixture.id == id.to_i }
  end

  private

  def attributes_for(game)
    attributes = game.slice(:id, :scheduled_at, :week, :stadium)
    attributes[:teams] = [
      game[:home_team].merge(type: "home"),
      game[:away_team].merge(type: "away")
    ]

    Fixture.new(attributes)
  end
end

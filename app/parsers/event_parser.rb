class EventParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def events
    root.xpath('soccer-ifb-game/plays/play').map do |event|
      Hash.from_xml(event.to_s)['play'].symbolize_keys
    end
  end

  def league_id
    root.xpath('league').first['global-id']
  end

  def home_team_id
    root.xpath('soccer-ifb-game/home-team/team-info').first['id']
  end

  def away_team_id
    root.xpath('soccer-ifb-game/visiting-team/team-info').first['id']
  end

  private

  def root
    @parser.xpath('//sports-statistics/sports-play-by-play').first
  end
end

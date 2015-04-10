class EventCodeParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def created_at
    DateParser.new(root).date
  end

  def version
    root.xpath('version').first['number']
  end

  def codes
    root.xpath('event-codes/event').map do |code|
      Hash.from_xml(code.to_s)['event'].symbolize_keys
    end
  end

  private

  def root
    @parser.xpath('//sports-statistics/sports-event-codes')
  end
end

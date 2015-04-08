class ScheduleParser
  def initialize(content)
    @parser = Nokogiri::XML(content)
  end

  def created_at
    DateParser.new(root).date
  end

  private

  def root
    @parser.xpath('//sports-statistics/sports-schedule').first
  end

  def convert(node)
    node.to_h.map { |key, value| [key.gsub('-', '_'), value] }.to_h.with_indifferent_access
  end
end

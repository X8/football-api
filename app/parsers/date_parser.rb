class DateParser
  def initialize(node)
    @node = node
  end

  def date
    DateTime.new(
      date_node['year'].to_i, date_node['month'].to_i, date_node['date'].to_i,
      time_node['hour'].to_i, time_node['minute'].to_i, time_node['second'].to_i
    )
  end

  private

  def date_node
    @node.xpath('date').first
  end

  def time_node
    @node.xpath('time').first
  end
end

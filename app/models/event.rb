class Event
  include Virtus.value_object

  values do
    attribute :sequence, Integer
    attribute :type_id, Integer
    attribute :name, String
    attribute :offensive_player, BasicPlayer
    attribute :defensive_player, BasicPlayer
    attribute :assisting_player, BasicPlayer
    attribute :key_passing_player, BasicPlayer
    attribute :replaced_player, BasicPlayer
    attribute :time, PointInGame
    attribute :coordinates, Coordinate
    attribute :score, Score
    attribute :description, String
    attribute :field_area, String
  end
end

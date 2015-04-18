class Event
  include Virtus.value_object

  values do
    attribute :sequence, Integer
    attribute :type_id, Integer
    attribute :name, String
    attribute :player, Player
    attribute :recipient_player, Player
    attribute :time, PointInGame
    attribute :coordinates, Coordinate
    attribute :score, Score
    attribute :description, String
    attribute :field_area, String
  end
end

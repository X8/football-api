class Fixture
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :scheduled_at, DateTime
    attribute :week, Integer
    attribute :stadium, Stadium
    attribute :teams, Array[Team]
  end
end

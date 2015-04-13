class Score
  include Virtus.value_object

  values do
    attribute :home, Integer
    attribute :away, Integer
  end
end

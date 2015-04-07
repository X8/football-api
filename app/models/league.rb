class League
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :name, String
    attribute :alias, String
  end
end


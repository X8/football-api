class EventCode
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :text, String
  end
end

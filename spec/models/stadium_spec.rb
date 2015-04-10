require 'rails_helper'

describe Stadium do
  let(:attributes) do
    {
      id: 1,
      name: "Stadium name"
    }
  end

  subject { described_class.new(attributes) }

  it "#id" do
    expect(subject.id).to eq(1)
  end

  it "#name" do
    expect(subject.name).to eq("Stadium name")
  end
end


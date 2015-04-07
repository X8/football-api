require 'rails_helper'

describe League do
  let(:league_name) { "League name" }
  let(:alias_name)  { "LA" }
  let(:attributes) do
    {
      id: 10,
      name: league_name,
      alias: alias_name,
    }
  end

  subject { described_class.new(attributes) }

  it "#id" do
    expect(subject.id).to eq(10)
  end

  it "#name" do
    expect(subject.name).to eq(league_name)
  end

  it "#alias" do
    expect(subject.alias).to eq(alias_name)
  end
end


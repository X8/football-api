require 'rails_helper'

describe Team do
  let(:attributes) do
    {
      id: "1",
      type: "home_team",
      score: "10",
      name: "Team",
      abbreviation: "T"
    }
  end

  subject { described_class.new(attributes) }

  it "#id" do
    expect(subject.id).to eq(1)
  end

  it "#type" do
    expect(subject.type).to eq("home_team")
  end

  it "#score" do
    expect(subject.score).to eq(10)
  end

  it "#name" do
    expect(subject.name).to eq("Team")
  end

  it "#abbreviation" do
    expect(subject.abbreviation).to eq("T")
  end
end

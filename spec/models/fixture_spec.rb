require 'rails_helper'

describe Fixture do
  let(:date) { Time.now }
  let(:attributes) do
    {
      id: 1,
      scheduled_at: date,
      week: 5,
      stadium: {
        id: 1,
        name: "Stadium"
      },
      teams: [
        {
          id: "1",
          score: "3",
          type: "home_team",
          name: "Name",
          abbreviation: "N",
          location: "UK"
        }
      ]
    }
  end

  subject { described_class.new(attributes) }

  it "#id" do
    expect(subject.id).to eq(1)
  end

  it "#scheduled_at" do
    expect(subject.scheduled_at).to eq(date)
  end

  it "#week" do
    expect(subject.week).to eq(5)
  end

  it "#stadium" do
    expect(subject.stadium).to eq(Stadium.new(attributes[:stadium]))
  end

  describe "#teams" do
    describe "one team" do
      let(:team) { subject.teams.first }

      it "returns team" do
        expect(team).to eq(Team.new(attributes[:teams].first))
      end
    end
  end
end

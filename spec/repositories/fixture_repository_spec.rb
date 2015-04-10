require 'rails_helper'

describe FixtureRepository do
  let(:adapter) { FakeFileSystemAdapter.new }
  let(:fixture) do
    Fixture.new(
      id: "1171996",
      scheduled_at: DateTime.parse("2012-06-08 12:00:00"),
      week: "15",
      stadium: {
        id: "3038",
        name: "National Stadium",
      },
      status: {
        id: "4",
        name: "Final"
      },
      teams: [
        {
          id: "252",
          type: "home",
          score: "1",
          name: "Poland",
          abbreviation: "POL",
          location: "Poland"
        },
        {
          id: "274",
          type: "away",
          score: "1",
          name: "Greece",
          abbreviation: "GRE",
          location: "Greece"
        }
      ]
    )
  end

  subject { FixtureRepository.new(adapter) }

  describe "#get_fixtures" do
    it "returns fixture objects" do
      expect(subject.get_fixtures).to include(fixture)
    end
  end

  describe "#get_fixture" do
    it "returns fixture object" do
      expect(subject.get_fixture(80, 1171996)).to eq(fixture)
    end
  end
end

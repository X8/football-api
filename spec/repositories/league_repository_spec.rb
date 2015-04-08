require 'rails_helper'

describe LeagueRepository do
  let(:adapter) { FakeFileSystemAdapter.new }
  let(:league) do
    League.new(
      id:     39,
      name:   "English Premier League",
      alias:  "EPL"
    )
  end

  subject { described_class.new(adapter) }

  describe "#get_league" do
    it "returns league object" do
      expect(subject.get_league(1)).to eq(league)
    end
  end

  describe "get_leagues" do
    it "returns array of leagues" do
      expect(subject.get_leagues).to include(league)
    end
  end
end

require 'rails_helper'

describe EventParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/pbp.xml")).read }

  subject { described_class.new(xml) }

  describe "#events" do
    let(:event) { subject.events.first }

    it "returns dictionary" do
      expect(event).to be_kind_of(Hash)
    end

    describe "event" do
      it "includes half" do
        expect(event).to include(half: "1")
      end
    end
  end

  describe "#league_id" do
    it "returns league id" do
      expect(subject.league_id).to eq("54")
    end
  end

  describe "#home_team_id" do
    it "returns home team id" do
      expect(subject.home_team_id).to eq("1199")
    end
  end

  describe "#away_team_id" do
    it "returns away team id" do
      expect(subject.away_team_id).to eq("1199")
    end
  end
end

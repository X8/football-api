require 'rails_helper'

describe FileSystemAdapter do
  let(:root) { Rails.root.join("spec/fixtures/data/") }

  subject { described_class.new(root) }

  describe "#get_league" do
    it "returns league file content" do
      expect(subject.get_league(1)).to include("League 1 info")
    end
  end

  describe "#get_leagues" do
    it "returns list of leagues" do
      expect(subject.get_leagues).to match_array(["League 1 info\n", "League 2 info\n"])
    end
  end

  describe "#get_schedule" do
    it "returns schedule file content" do
      expect(subject.get_schedule(1)).to include("Schedule 1 info")
    end
  end

  describe "#get_schedules" do
    it "returns list of schedules file content" do
      expect(subject.get_schedules).to match_array(["Schedule 1 info\n", "Schedule 2 info\n"])
    end
  end

  describe "#get_roster" do
    it "returns roster file content" do
      expect(subject.get_roster(1)).to include("Roster 1 info")
    end
  end

  describe "#get_rosters" do
    it "returns roster file content" do
      expect(subject.get_rosters).to match_array(["Roster 1 info\n", "Roster 2 info\n"])
    end
  end

  describe "#get_event_codes" do
    it "returns roster file content" do
      expect(subject.get_event_codes).to include("Event codes info")
    end
  end
end

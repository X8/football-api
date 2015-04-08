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
end

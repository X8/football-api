require 'rails_helper'

describe TeamParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/team_info.xml")) }

  subject { described_class.new(xml) }

  it "#created_at" do
    expect(subject.created_at).to eq(DateTime.parse("27-08-2012 16:48:18"))
  end

  it "#version" do
    expect(subject.version).to eq("3")
  end

  describe "#league" do
    it "contains global_id" do
      expect(subject.league).to include(global_id: "39")
    end

    it "contains name" do
      expect(subject.league).to include(name: "English Premier League")
    end

    it "contains alias" do
      expect(subject.league).to include(alias: "EPL")
    end
  end

  describe "#season" do
    it "contains id" do
      expect(subject.season).to include(id: "1")
    end

    it "contains year" do
      expect(subject.season).to include(year: "2012")
    end

    it "contains description" do
      expect(subject.season).to include(description: "2012 EPL Season")
    end
  end

  describe "#teams" do
    let(:team) { subject.teams.first }

    describe "team" do
      it "contains global_id" do
        expect(team).to include(global_id: "6145")
      end

      it "contains id" do
        expect(team).to include(id: "21")
      end

      it "contains location" do
        expect(team).to include(location: "Arsenal")
      end

      it "contains alias" do
        expect(team).to include(alias: "ARS")
      end

      it "contains name" do
        expect(team).to include(display_name: "Arsenal")
      end

      it "contains country_id" do
        expect(team).to include(country_id: "20")
      end

      it "contains country" do
        expect(team).to include(country: "England")
      end

      it "contains year_founded" do
        expect(team).to include(year_founded: "1886")
      end
    end
  end
end


require 'rails_helper'

describe ScheduleParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/schedule.xml")).read }

  subject { described_class.new(xml) }

  it "#created_at" do
    expect(subject.created_at).to eq(DateTime.parse("2012-09-17 12:55:00"))
  end

  it "#version" do
    expect(subject.version).to eq("5")
  end

  describe "#games" do
    let(:game) { subject.games.first }

    describe "single game" do
      it "contains id" do
        expect(game).to include(id: "1171996")
      end

      it "contains scheduled_at" do
        expect(game).to include(scheduled_at: DateTime.parse("2012-06-08 12:00"))
      end

      it "contains week" do
        expect(game).to include(week: "15")
      end

      describe "stadium" do
        let(:stadium) { game[:stadium] }

        it "contains id" do
          expect(stadium).to include(id: "3038")
        end

        it "contains name" do
          expect(stadium).to include(name: "National Stadium")
        end
      end

      describe "status" do
        let(:status) { game[:status] }

        it "contains id" do
          expect(status).to include(id: "4")
        end

        it "contains name" do
          expect(status).to include(name: "Final")
        end
      end

      describe "home_team" do
        let(:team) { game[:home_team] }

        it "contains id" do
          expect(team).to include(id: "252")
        end

        it "contains score" do
          expect(team).to include(score: "1")
        end

        it "contains name" do
          expect(team).to include(name: "Poland")
        end

        it "contains alias" do
          expect(team).to include(abbreviation: "POL")
        end
      end

      describe "away_team" do
        let(:team) { game[:away_team] }

        it "contains id" do
          expect(team).to include(id: "274")
        end

        it "contains score (missing score)" do
          expect(team).to include(score: 0)
        end

        it "contains name" do
          expect(team).to include(name: "Greece")
        end

        it "contains alias" do
          expect(team).to include(abbreviation: "GRE")
        end
      end
    end
  end
end


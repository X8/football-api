require 'rails_helper'

describe Api::FixturesController do
  describe "GET /leagues/:id/fixtures" do
    subject { get(:index, league_id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end

  describe "GET /leagues/:id/fixtures/:id" do
    subject { get(:index, league_id: 1, fixture_id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end

  describe "GET /leagues/:id/fixtures/gameweek/:gameweek" do
    subject { get(:gameweek, league_id: 1, gameweek: 30, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end
end

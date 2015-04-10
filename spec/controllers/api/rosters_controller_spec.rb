require 'rails_helper'

describe Api::RostersController do
  describe "GET /leagues/:league_id/rosters" do
    subject { get(:index, league_id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end

  describe "GET /leagues/:leagues_id/rosters/:id" do
    subject { get(:show, league_id: 1, id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end
end

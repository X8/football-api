require 'rails_helper'

describe Api::EventsController do
  describe "GET /leagues/:league_id/fixtures/:fixture_id/events" do
    subject { get(:index, league_id: 1, fixture_id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end

  describe "GET /leagues/:league_id/fixtures/:fixture_id/events/:id" do
    subject { get(:show, league_id: 1, fixture_id: 1, id: 6, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end
end

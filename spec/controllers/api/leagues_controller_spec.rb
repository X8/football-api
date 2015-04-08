require 'rails_helper'

describe Api::LeaguesController do
  describe "GET /leagues" do
    subject { get(:index, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end

  describe "GET /leagues/:id" do
    subject { get(:show, id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end
end

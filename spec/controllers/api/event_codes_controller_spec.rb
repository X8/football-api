require 'rails_helper'

describe Api::EventCodesController do
  describe "GET /event_codes" do
    subject { get(:index, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end

  describe "GET /event_codes/:id" do
    subject { get(:show, id: 1, format: :json) }

    it "responds with success" do
      expect(subject).to be_success
    end
  end
end

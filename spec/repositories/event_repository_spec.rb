require 'rails_helper'

describe EventRepository do
  let(:adapter) { FakeFileSystemAdapter.new }

  subject { EventRepository.new(adapter) }

  describe "#get_events" do
    it "returns code objects" do
      expect(subject.get_events(1, 1).size).to eq(1)
    end
  end

  describe "#get_code" do
    it "returns code objects" do
      expect(subject.get_event(1, 1, 6)).to be_kind_of(Event)
    end
  end
end

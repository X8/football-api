require 'rails_helper'

describe EventCodeRepository do
  let(:adapter) { FakeFileSystemAdapter.new }
  let(:event) do
    EventCode.new(
      id: 1,
      text: "Ball Location"
    )
  end

  subject { EventCodeRepository.new(adapter) }

  describe "#get_codes" do
    it "returns code objects" do
      expect(subject.get_codes).to include(event)
    end
  end

  describe "#get_code" do
    it "returns code objects" do
      expect(subject.get_code(1)).to eq(event)
    end
  end
end

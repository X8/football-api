require 'rails_helper'

describe EventCodeParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/event_code.xml")).read }

  subject { described_class.new(xml) }

  it "#created_at" do
    expect(subject.created_at).to eq(DateTime.parse("2014-12-02 17:14:37"))
  end

  it "#version" do
    expect(subject.version).to eq("2")
  end

  describe "codes" do
    let(:code) { subject.codes.first }

    describe "one code" do
      it "contains id" do
        expect(code).to include(id: "1")
      end

      it "contains text" do
        expect(code).to include(text: "Ball Location")
      end
    end
  end
end


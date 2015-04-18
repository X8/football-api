require 'rails_helper'

describe EventParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/pbp.xml")).read }

  subject { described_class.new(xml) }

  describe "#events" do
    let(:event) { subject.events.first }

    it "returns dictionary" do
      expect(event).to be_kind_of(Hash)
    end

    describe "event" do
      it "includes event time" do
        expect(event).to include(time: { half: "1", minutes: "15", seconds: "15", additional_minutes: "0" })
      end

      it "includes event name" do
        expect(event).to include(name: "Cross")
      end

      it "includes field area" do
        expect(event).to include(field_area: "VE20")
      end

      it "includes type_id" do
        expect(event).to include(type_id: "6")
      end

      it "includes offensive player" do
        expect(event).to include(offensive_player: { id: "110683", first_name: "Patxi", last_name: "Puñal" })
      end
    end
  end

  describe "#league_id" do
    it "returns league id" do
      expect(subject.league_id).to eq("54")
    end
  end
end

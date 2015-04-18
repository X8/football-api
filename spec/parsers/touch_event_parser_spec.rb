require 'rails_helper'

describe TouchEventParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/touch_events.xml")).read }

  subject { described_class.new(xml) }

  describe "#touch_events" do
    let(:event) { subject.touch_events.first }

    describe "event" do
      it "includes event time" do
        expect(event).to include(time: { half: "1", minutes: "1", seconds: "2", additional_minutes: "0" })
      end

      it "includes event name" do
        expect(event).to include(name: "Good Pass")
      end

      it "includes touch_type_id" do
        expect(event).to include(touch_type_id: "1")
      end

      it "includes player details" do
        expect(event).to include(player: { id: "24702", first_name: "Bafetimbi", last_name: "Gomis" })
      end

      it "includes recipient details" do
        expect(event).to include(player: { id: "24702", first_name: "Bafetimbi", last_name: "Gomis" })
      end
    end
  end
end

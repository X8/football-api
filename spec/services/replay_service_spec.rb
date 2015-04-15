require 'rails_helper'

describe ReplayService do
  let(:pusher_client) { double(trigger: true) }
  let(:league_id)     { 1 }
  let(:fixture_id)    { 2 }
  let(:event_1)       { Event.new(sequence: 1, time: { minutes: 5, seconds: 10, additional_minutes: 0 }) }
  let(:event_2)       { Event.new(sequence: 2, time: { minutes: 5, seconds: 11, additional_minutes: 0 }) }
  let(:event_3)       { Event.new(sequence: 3, time: { minutes: 5, seconds: 13, additional_minutes: 0 }) }
  let(:events)        { [event_1, event_2, event_3] }
  let(:channel)       { "match_#{fixture_id}" }

  subject { described_class.new(pusher_client, league_id, fixture_id) }

  before do
    allow(subject).to receive(:events).and_return(events)
  end

  describe "#channel" do
    it "returns channel name for fixture" do
      expect(subject.channel).to eq(channel)
    end
  end

  describe "#current_event" do
    it "returns first event" do
      expect(subject.current_event).to eq(events.first)
    end
  end

  describe "#next_event" do
    it "returns next event" do
      expect(subject.next_event).to eq(events.second)
    end
  end

  describe "#dispatch_event" do
    before do
      expect(pusher_client).to receive(:trigger).with(channel, 'event', subject.current_event.as_json)
      subject.dispatch_event
    end

    it "changes current event" do
      expect(subject.current_event).to eq(events.second)
    end

    it "changes next event" do
      expect(subject.next_event).to eq(events.third)
    end

    describe "no next event" do
      before { subject.dispatch_event }

      it "returns nil for next event" do
        expect(subject.next_event).to eq(nil)
      end
    end
  end

  describe "#time_to_wait" do
    it "returns 1 seconds" do
      expect(subject.time_to_wait).to eq(1)
    end
  end

  describe "#start_in_thread" do
    it "sends all events" do
      expect(pusher_client).to receive(:trigger).with(channel, 'event', events.first.as_json)
      expect(pusher_client).to receive(:trigger).with(channel, 'event', events.second.as_json)
      expect(pusher_client).to receive(:trigger).with(channel, 'event', events.third.as_json)

      subject.start_in_thread.join
    end
  end

end

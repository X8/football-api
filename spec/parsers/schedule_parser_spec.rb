require 'rails_helper'

describe ScheduleParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/schedule.xml")) }

  subject { described_class.new(xml) }

  it "#created_at" do
    expect(subject.created_at).to eq(DateTime.parse("2012-09-17 12:55:00"))
  end
end


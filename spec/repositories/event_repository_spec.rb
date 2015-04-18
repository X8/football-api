require 'rails_helper'

describe EventRepository do
  let(:adapter) { FakeFileSystemAdapter.new }

  let(:player_1) do
    Player.new(
      id: "110683",
      first_name: "Alain",
      last_name: "Alain",
      position: "Defender",
      height: "72",
      weight: "168",
      birthdate: {
        year: "1989",
        month: "11",
        date: "13"
      },
      birthplace: {
        city: "Gijon",
        country: "Spain"
      },
      nationality: {
        id: "39",
        name: "Spain"
      }
    )
  end

  let(:player_2) do
    Player.new(
      id: 77424,
      first_name: "Ayoze",
      last_name: "Ayoze",
      position: "Midfielder",
      height: 68,
      weight: 159,
      birthdate: {
        year: 1985,
        month: 11,
        date:  22
      },
      birthplace: {
        country: "Spain",
        city:"Puerto de la Cruz"
      },
      nationality: {
        name: "Spain"
      }
    )
  end

  let(:time) do
    PointInGame.new(
      half: 1,
      minutes: 15,
      seconds: 15,
      additional_minutes: 0
    )
  end

  let(:coordinate) do
    Coordinate.new(
      x: 10,
      y: 20
    )
  end

  let(:score) do
    Score.new(
      home: 0,
      away: 1
    )
  end

  let(:event) do
    Event.new(
      sequence: 6,
      type_id: 6,
      name: "Cross",
      player: player_1,
      recipient_player: player_2,
      time: time,
      score: score,
      coordinates: coordinate,
      description: "Puñal's cross",
      field_area: "VE20"
    )
  end

  subject { EventRepository.new(adapter) }

  describe "#get_events" do
    it "returns code objects" do
      expect(subject.get_events(1, 1)).to include(event)
    end
  end

  describe "#get_code" do
    it "returns code objects" do
      expect(subject.get_event(1, 1, 6)).to eq(event)
    end
  end
end

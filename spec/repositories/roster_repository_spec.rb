require 'rails_helper'

describe RosterRepository do
  let(:adapter)   { FakeFileSystemAdapter.new }
  let(:league_id) { 1 }
  let(:id)        { 1199 }
  let(:roster) do
    Roster.new(
      {
        team: {
          id: 1199,
          name: "Sporting",
          abbreviation: "GIJ",
          score: 0,
          location: "Sporting"
        },
        players: [
          {
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
          },
          {
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
          }
        ]
      }
    )
  end

  subject { RosterRepository.new(adapter) }

  describe "#get_rosters" do
    it "returns fixture objects" do
      expect(subject.get_rosters(league_id)).to include(roster)
    end
  end

  describe "#get_roster" do
    it "returns fixture object" do
      expect(subject.get_roster(league_id, id)).to eq(roster)
    end
  end
end

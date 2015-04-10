require 'rails_helper'

describe RosterParser do
  let(:xml) { File.open(Rails.root.join("spec/fixtures/stats.com/roster.xml")).read }

  subject { described_class.new(xml) }

  it "#created_at" do
    expect(subject.created_at).to eq(DateTime.parse("2012-03-20 18:18:23"))
  end

  it "#version" do
    expect(subject.version).to eq("3")
  end

  describe "#teams" do
    let(:team) { subject.teams.first }

    describe "one team" do
      it "includes team id" do
        expect(team).to include(id: "1199")
      end

      it "includes abbreviation" do
        expect(team).to include(abbreviation: "GIJ")
      end

      it "includes location" do
        expect(team).to include(location: "Sporting")
      end

      it "inclues name" do
        expect(team).to include(name: "Sporting")
      end

      it "includes score (missing)" do
        expect(team).to include(score: 0)
      end

      describe "players" do
        let(:player) { team[:players].first }

        describe "one player" do
          it "includes id" do
            expect(player).to include(id: "110683")
          end

          it "includes first name" do
            expect(player).to include(first_name: "Alain")
          end

          it "includes last name" do
            expect(player).to include(last_name: "Alain")
          end

          it "includes player postition" do
            expect(player).to include(position: "Defender")
          end

          it "includes height" do
            expect(player).to include(height: "72")
          end

          it "includes weight" do
            expect(player).to include(weight: "168")
          end

          describe "birthdate" do
            let(:birthdate) { player[:birthdate] }

            it "includes year" do
              expect(birthdate).to include(year: "1989")
            end

            it "includes month" do
              expect(birthdate).to include(month: "11")
            end

            it "includes date" do
              expect(birthdate).to include(date: "13")
            end
          end
        end

        describe "birthplace" do
          let(:birthplace) { player[:birthplace] }

          it "includes country" do
            expect(birthplace).to include(country: "Spain")
          end

          it "includes city" do
            expect(birthplace).to include(city: "Gijon")
          end
        end

        describe "nationality" do
          let(:nationality) { player[:nationality] }

          it "includes name" do
            expect(nationality).to include(name: "Spain")
          end
        end
      end
    end
  end
end


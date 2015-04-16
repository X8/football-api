class Api::FixturesController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_fixtures(params[:league_id]))
  end

  def show
    respond_with(repository.get_fixture(params[:league_id], params[:id]))
  end

  def gameweek
    respond_with(repository.get_fixtures_for_gameweek(params[:league_id], params[:gameweek].to_i))
  end

  private

  def repository
    @repository ||= FixtureRepository.new
  end
end


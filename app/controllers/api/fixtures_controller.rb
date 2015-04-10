class Api::FixturesController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_fixture(params[:league_id]))
  end

  private

  def repository
    @repository ||= FixtureRepository.new
  end
end


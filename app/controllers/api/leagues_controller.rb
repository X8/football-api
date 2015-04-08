class Api::LeaguesController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_leagues)
  end

  def show
    respond_with(repository.get_league(params[:id]))
  end

  private

  def repository
    @repository ||= LeagueRepository.new
  end
end

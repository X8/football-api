class Api::RostersController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_rosters(params[:league_id]))
  end

  def show
    respond_with(repository.get_roster(params[:league_id], params[:id]))
  end

  def repository
    @repository ||= RosterRepository.new
  end
end

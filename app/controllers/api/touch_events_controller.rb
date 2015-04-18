class Api::TouchEventsController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_touch_events(league_id, fixture_id))
  end

  private

  def league_id
    params[:league_id].to_i
  end

  def fixture_id
    params[:fixture_id].to_i
  end

  def id
    params[:id].to_i
  end

  def repository
    @repository ||= TouchEventRepository.new
  end
end


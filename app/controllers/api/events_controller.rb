class Api::EventsController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_events(league_id, fixture_id))
  end

  def show
    respond_with(repository.get_event(league_id, fixture_id, id))
  end

  def start
    service = ReplayService.new(Pusher, league_id, fixture_id)
    service.start

    render json: {
      message: "Application started sending events on the channel '#{service.channel}'.",
      pusher: {
        key: Pusher.key,
        channel: service.channel
      }
    }
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
    @repository ||= EventRepository.new
  end
end


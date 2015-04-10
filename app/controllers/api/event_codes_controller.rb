class Api::EventCodesController < ApplicationController
  respond_to :json

  def index
    respond_with(repository.get_codes)
  end

  def show
    respond_with(repository.get_code(params[:id]))
  end

  private

  def repository
    @repository ||= EventCodeRepository.new
  end
end


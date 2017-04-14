class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end

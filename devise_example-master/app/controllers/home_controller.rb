class HomeController < ApplicationController

  before_action :authenticate_user!, only: :token

  def token
    render layout: 'application'

  end

  def initialize
    unless @game
      get_games

      #@levels = [] unless @levels
      #get_levels
    end

  end

  def index
    render layout: 'application'

  end



  def get_levels
    @levels =  Level.where(:game_id=>@game)
  end

  # Use callbacks to share common setup or constraints between actions.
  def get_games
    @games = Game.where(:user_id=>:id)
  end

end

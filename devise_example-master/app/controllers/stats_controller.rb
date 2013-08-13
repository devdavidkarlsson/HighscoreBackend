class StatsController < ApplicationController
  def topofday
    set_game
    get_levels
  end

  def get_levels
    @levels =  Level.where(:game_id=>@games)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @games = Game.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
  end

  def sum_game

    #For each user_id, sum levels


  end
end

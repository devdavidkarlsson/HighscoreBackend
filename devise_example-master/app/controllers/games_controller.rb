class GamesController < ApplicationController
  before_action :set_game,:initialize, only: [:show, :edit, :update, :destroy]



  attr_reader :levels


  def initialize
    if @game
      @levels = [] unless @levels
      get_levels
    end

  end


  def add_level
    set_game
    @level = @game.levels.create(:game_id=>params[:id])
    @level.save
    flash[:notice]="Level added"

    redirect_to edit_game_path(params[:id])

  end

  def remove_level
      set_game
      unless @game.levels.length < 2
        get_levels
        @level=@levels.pop
        @level.destroy
        flash[:notice]="Removed Level"
      else
        flash[:notice]="Cannot remove last Level"

      end
      redirect_to edit_game_path(params[:id])


  end

  def save_scores
    #Save all scores from fields in editview


     redirect_to edit_game_path(params[:id])

  end

  # GET /games
  # GET /games.json
  def index
    @games = Game.where(:user_id=> current_user.id)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    get_levels
    respond_to do |format|
        format.html { redirect_to games_url(params[:id]) }
        format.json { render json: @levels}
    end

  end

  # GET /games/new
  def new
    @game = Game.new
    @game.user_id = current_user.id
    @game.save
    @level = @game.levels.create(:game_id=>@game)
    @level.save
  end


  # GET /games/1/edit
  def edit

  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
  #levels for game
  def get_levels
    @levels =  Level.where(:game_id=>@game)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_game
        @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, levels_attributes: [:score, :id])
    end
end

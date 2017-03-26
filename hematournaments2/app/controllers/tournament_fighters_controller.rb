class TournamentFightersController < ApplicationController
  before_action :set_tournament_fighter, only: [:show, :edit, :update, :destroy]

  # GET /tournament_fighters
  # GET /tournament_fighters.json
  def index
    @tournament_fighters = TournamentFighter.all
  end

  # GET /tournament_fighters/1
  # GET /tournament_fighters/1.json
  def show
  end

  # GET /tournament_fighters/new
  def new
    @tournaments = Tournament.all
    @fighters = Fighter.all
    @tournament_fighter = TournamentFighter.new
  end

  # GET /tournament_fighters/1/edit
  def edit
    @tournaments = Tournament.all
    @fighters = Fighter.all
  end

  # POST /tournament_fighters
  # POST /tournament_fighters.json
  def create
    @tournaments = Tournament.all
    @fighters = Fighter.all
    @tournament_fighter = TournamentFighter.new(tournament_fighter_params)

    respond_to do |format|
      if @tournament_fighter.save
        format.html { redirect_to @tournament_fighter, notice: 'Tournament fighter was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_fighter }
      else
        format.html { render :new }
        format.json { render json: @tournament_fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_fighters/1
  # PATCH/PUT /tournament_fighters/1.json
  def update
    respond_to do |format|
      if @tournament_fighter.update(tournament_fighter_params)
        format.html { redirect_to @tournament_fighter, notice: 'Tournament fighter was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament_fighter }
      else
        format.html { render :edit }
        format.json { render json: @tournament_fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_fighters/1
  # DELETE /tournament_fighters/1.json
  def destroy
    @tournament_fighter.destroy
    respond_to do |format|
      format.html { redirect_to tournament_fighters_url, notice: 'Tournament fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_fighter
      @tournament_fighter = TournamentFighter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_fighter_params
      params.require(:tournament_fighter).permit(:tournament_id, :fighter_id)
    end
end

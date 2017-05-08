class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy, :remove_exchange, :add_exchange]
  before_action :set_tournament
  before_action :set_pool

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.where(pool_id: @pool.id)
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(
      pool_id: @pool.id,
      red_fighter_id: params[:match][:red_fighter_id],
      blue_fighter_id: params[:match][:blue_fighter_id],
      order: params[:match][:order])

    respond_to do |format|
      if @match.save
        format.html { redirect_to match_path(id: @match.id, tournament_id: @tournament.id, pool_id: @pool.id), notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(
            pool_id: @pool.id,
            red_fighter_id: params[:match][:red_fighter_id],
            blue_fighter_id: params[:match][:blue_fighter_id],
            order: params[:match][:order])
        format.html { redirect_to match_path(id: @match.id, tournament_id: @tournament.id, pool_id: @pool.id), notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_path(tournament_id: @tournament.id, pool_id: @pool.id), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_exchange
    @match.remove_exchange(params[:exchange_id])
    redirect_to match_path(id: @match.id, tournament_id: @tournament.id, pool_id: @pool.id)
  end

  def add_exchange
    if params[:fighter].nil? && params[:penalty_fighter].nil?
      puts "Nothing to add"
      return
    end
    if params[:fighter] == params[:penalty_fighter]
      puts "Wrong fighters"
      return
    end
    puts "Adding exchange"
    @match.add_exchange(params[:fighter], params[:target], params[:penalty_fighter], params[:penalty])
    redirect_to match_path(id: @match.id, tournament_id: @tournament.id, pool_id: @pool.id)
  end

  private
    def set_pool
      @pool = Pool.find(params[:pool_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end
end

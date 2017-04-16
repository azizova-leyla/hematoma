class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy, :add_fighter, :remove_fighter,
    :create_matches]
  before_action :set_tournament

  # GET /pools
  # GET /pools.json
  def index
    @pools = Pool.where(tournament_id: @tournament.id)
  end

  # GET /pools/1
  # GET /pools/1.json
  def show
  end

  # GET /pools/new
  def new
    @pool = Pool.new
  end

  # GET /pools/1/edit
  def edit
  end

  # POST /pools
  # POST /pools.jso
  def create
    @pool = Pool.new(name: params[:pool][:name], tournament_id: @tournament.id)

    respond_to do |format|
      if @pool.save
        format.html { redirect_to pools_path(tournament_id: @tournament.id), notice: 'Pool was successfully created.' }
        format.json { render :show, status: :created, location: @pool }
      else
        format.html { render :new }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pools/1
  # PATCH/PUT /pools/1.json
  def update
    respond_to do |format|
      if @pool.update(name: params[:pool][:name], tournament_id: @tournament.id)
        format.html { redirect_to pools_path(tournament_id: @tournament.id), notice: 'Pool was successfully updated.' }
        format.json { render :show, status: :ok, location: @pool }
      else
        format.html { render :edit }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pools/1
  # DELETE /pools/1.json
  def destroy
    @pool.destroy
    respond_to do |format|
      format.html { redirect_to pools_url(tournament_id: @tournament.id), notice: 'Pool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_fighter
    @pool.add_fighter(params[:fighter_id])
    redirect_to pools_path
  end

  def remove_fighter
    @pool.remove_fighter(params[:fighter_id])
    redirect_to pools_path
  end

  def add_fighters
    fighters_ids_to_add = params[:fighter]
    pool_id = params[:pool_id]
    if fighters_ids_to_add && fighters_ids_to_add.any?
      @tournament.reassign_fighters_to_pool(fighters_ids_to_add, pool_id)
    end
    redirect_to pools_path
  end

  def create_matches
    @pool.create_matches
    redirect_to matches_path(tournament_id: @tournament.id, pool_id: @pool.id)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end
end

class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]
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
        format.html { redirect_to pool_path(id: @pool.id, tournament_id: @tournament.id), notice: 'Pool was successfully created.' }
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
        format.html { redirect_to pool_path(id: @pool.id, tournament_id: @tournament.id), notice: 'Pool was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end
end

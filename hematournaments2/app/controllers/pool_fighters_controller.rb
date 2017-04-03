class PoolFightersController < ApplicationController
  before_action :set_pool_fighter, only: [:show, :edit, :update, :destroy]

  # GET /pool_fighters
  # GET /pool_fighters.json
  def index
    @pool_fighters = PoolFighter.all
  end

  # GET /pool_fighters/1
  # GET /pool_fighters/1.json
  def show
  end

  # GET /pool_fighters/new
  def new
    @pool_fighter = PoolFighter.new
  end

  # GET /pool_fighters/1/edit
  def edit
  end

  # POST /pool_fighters
  # POST /pool_fighters.json
  def create
    @pool_fighter = PoolFighter.new(pool_fighter_params)

    respond_to do |format|
      if @pool_fighter.save
        format.html { redirect_to @pool_fighter, notice: 'Pool fighter was successfully created.' }
        format.json { render :show, status: :created, location: @pool_fighter }
      else
        format.html { render :new }
        format.json { render json: @pool_fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pool_fighters/1
  # PATCH/PUT /pool_fighters/1.json
  def update
    respond_to do |format|
      if @pool_fighter.update(pool_fighter_params)
        format.html { redirect_to @pool_fighter, notice: 'Pool fighter was successfully updated.' }
        format.json { render :show, status: :ok, location: @pool_fighter }
      else
        format.html { render :edit }
        format.json { render json: @pool_fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pool_fighters/1
  # DELETE /pool_fighters/1.json
  def destroy
    @pool_fighter.destroy
    respond_to do |format|
      format.html { redirect_to pool_fighters_url, notice: 'Pool fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool_fighter
      @pool_fighter = PoolFighter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pool_fighter_params
      params.require(:pool_fighter).permit(:pool_id, :fighter_id)
    end
end

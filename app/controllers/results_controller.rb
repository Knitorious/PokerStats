class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new(game_id: params[:game_id]) 
    player_ids = @result.game.results.pluck(:player_id)
    @players = Player.where.not(id: player_ids)
  end

  # GET /results/1/edit
  def edit
    @players = Player.all
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result.game, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        player_ids = @result.game.results.pluck(:player_id)
        @players = Player.where.not(id: player_ids)
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result.game, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        @players = Player.all
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    game = @result.game
    @result.destroy
    respond_to do |format|
      format.html { redirect_to game, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:game_id, :player_id, :place)
    end
end

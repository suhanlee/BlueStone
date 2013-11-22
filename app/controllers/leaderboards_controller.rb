class LeaderboardsController < ApplicationController
  before_action :set_app
  before_action :set_leaderboard, only: [:show, :edit, :update, :destroy]

  # GET /leaderboards
  # GET /leaderboards.json
  def index
    @leaderboards = @app.leaderboards.all
  end

  # GET /leaderboards/1
  # GET /leaderboards/1.json
  def show
	@leaderboards = @app.leaderboards.all
	@scores = @leaderboard.scores.find(:all, :order => "value DESC")
  end

  # GET /leaderboards/new
  def new
	#@leaderboard = Leaderboard.new
    #@leaderboard.app = @app
     @leaderboard = @app.leaderboards.new
	
	 respond_to do |format|
		format.html # new.html.erb
		format.json { render json: @leaderboard.api_fields(request_base_uri) }
	 end
  end

  # GET /leaderboards/1/edit
  def edit
  end

  # POST /leaderboards
  # POST /leaderboards.json
  def create
    @leaderboard = @app.leaderboards.new(leaderboard_params)
    respond_to do |format|
      if @leaderboard.save
        format.html { redirect_to [@app, @leaderboard], notice: 'Leaderboard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @leaderboard }
      else
        format.html { render action: 'new' }
        format.json { render json: @leaderboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaderboards/1
  # PATCH/PUT /leaderboards/1.json
  def update
    respond_to do |format|
      if @leaderboard.update(leaderboard_params)
        format.html { redirect_to [@app,@leaderboard], notice: 'Leaderboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @leaderboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaderboards/1
  # DELETE /leaderboards/1.json
  def destroy
    @leaderboard.destroy
    respond_to do |format|
      format.html { redirect_to app_leaderboard_path(@app, nil) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leaderboard
      @leaderboard = @app.leaderboards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leaderboard_params
      params.require(:leaderboard).permit(:icon, :name)
    end
	
	def set_app
		@app = App.find(params[:app_id])
	end
end

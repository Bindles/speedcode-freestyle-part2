class StreetFightersController < ApplicationController
  before_action :set_street_fighter, only: %i[ show edit update destroy ]

  # GET /street_fighters or /street_fighters.json
  def index
    @street_fighters = StreetFighter.order("#{params[:column]} #{params[:direction]}")
    # respond_to do |format|
    #   format.html # Full-page render for non-Turbo requests
    #   format.turbo_stream { render partial: "street_fighters/street_fighters_data", locals: { street_fighters: @street_fighters } }
    # end

    if turbo_frame_request?
      render turbo_stream: turbo_stream.replace("street_fighters_data", partial: "street_fighters/street_fighters_data", locals: { street_fighters: @street_fighters })
    else
      render :index
    end

    Rails.logger.info "Turbo Frame Request: #{turbo_frame_request?}, Params: #{params.inspect}"
    Rails.logger.info "Turbo Frame Headers: #{request.headers["Turbo-Frame"].present?}, Params: #{params.inspect}"    
  end

  # GET /street_fighters/1 or /street_fighters/1.json
  def show
  end

  # GET /street_fighters/new
  def new
    @street_fighter = StreetFighter.new
  end

  # GET /street_fighters/1/edit
  def edit
  end

  # POST /street_fighters or /street_fighters.json
  def create
    @street_fighter = StreetFighter.new(street_fighter_params)

    respond_to do |format|
      if @street_fighter.save
        format.html { redirect_to @street_fighter, notice: "Street fighter was successfully created." }
        format.json { render :show, status: :created, location: @street_fighter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @street_fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /street_fighters/1 or /street_fighters/1.json
  def update
    respond_to do |format|
      if @street_fighter.update(street_fighter_params)
        format.html { redirect_to @street_fighter, notice: "Street fighter was successfully updated." }
        format.json { render :show, status: :ok, location: @street_fighter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @street_fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /street_fighters/1 or /street_fighters/1.json
  def destroy
    @street_fighter.destroy!

    respond_to do |format|
      format.html { redirect_to street_fighters_path, status: :see_other, notice: "Street fighter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street_fighter
      @street_fighter = StreetFighter.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def street_fighter_params
      params.expect(street_fighter: [ :quote, :character, :move ])
    end
end

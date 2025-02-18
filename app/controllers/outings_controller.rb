class OutingsController < ApplicationController
  before_action :set_outing, only: %i[ show edit update destroy ]

  # GET /outings or /outings.json
  def index
    @outings = Outing.all
  end

  # GET /outings/1 or /outings/1.json
  def show
  end

  # GET /outings/new
  def new
    @outing = Outing.new
  end

  # GET /outings/1/edit
  def edit
  end

  # POST /outings or /outings.json
  def create
    @outing = Outing.new(outing_params)

    respond_to do |format|
      if @outing.save
        format.html { redirect_to @outing, notice: "Outing was successfully created." }
        format.json { render :show, status: :created, location: @outing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outings/1 or /outings/1.json
  def update
    respond_to do |format|
      if @outing.update(outing_params)
        format.html { redirect_to @outing, notice: "Outing was successfully updated." }
        format.json { render :show, status: :ok, location: @outing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outings/1 or /outings/1.json
  def destroy
    @outing.destroy!

    respond_to do |format|
      format.html { redirect_to outings_path, status: :see_other, notice: "Outing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outing
      @outing = Outing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def outing_params
      params.expect(outing: [ :location, :date ])
    end
end

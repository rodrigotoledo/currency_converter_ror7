class ConversionHistoriesController < ApplicationController
  before_action :set_conversion_history, only: %i[ show edit update destroy ]

  # GET /conversion_histories or /conversion_histories.json
  def index
    @conversion_histories = ConversionHistory.order(created_at: :desc)
  end

  # GET /conversion_histories/1 or /conversion_histories/1.json
  def show
  end

  # GET /conversion_histories/new
  def new
    @conversion_history = ConversionHistory.new
  end

  # GET /conversion_histories/1/edit
  def edit
  end

  # POST /conversion_histories or /conversion_histories.json
  def create
    @conversion_history = ConversionHistory.new(conversion_history_params)

    respond_to do |format|
      if @conversion_history.save
        format.html { redirect_to conversion_histories_url, notice: "Conversion history was successfully created." }
        format.json { render :show, status: :created, location: @conversion_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversion_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversion_histories/1 or /conversion_histories/1.json
  def update
    respond_to do |format|
      if @conversion_history.update(conversion_history_params)
        format.html { redirect_to conversion_history_url(@conversion_history), notice: "Conversion history was successfully updated." }
        format.json { render :show, status: :ok, location: @conversion_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversion_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversion_histories/1 or /conversion_histories/1.json
  def destroy
    @conversion_history.destroy

    respond_to do |format|
      format.html { redirect_to conversion_histories_url, notice: "Conversion history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversion_history
      @conversion_history = ConversionHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversion_history_params
      params.require(:conversion_history).permit(:from, :to, :amount, :result)
    end
end

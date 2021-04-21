class PoststagsController < ApplicationController
  before_action :set_poststag, only: [:show, :update, :destroy]

  # GET /poststags
  def index
    @poststags = Poststag.all

    render json: @poststags
  end

  # GET /poststags/1
  def show
    render json: @poststag
  end

  # POST /poststags
  def create
    @poststag = Poststag.new(poststag_params)

    if @poststag.save
      render json: @poststag, status: :created, location: @poststag
    else
      render json: @poststag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /poststags/1
  def update
    if @poststag.update(poststag_params)
      render json: @poststag
    else
      render json: @poststag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /poststags/1
  def destroy
    @poststag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poststag
      @poststag = Poststag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poststag_params
      params.require(:poststag).permit(:post_id, :tag_id)
    end
end

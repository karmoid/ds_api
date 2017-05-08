

class PlayitemsController < ApplicationController
  before_action :set_playitem, only: [:show, :update, :destroy]

  # GET /playitems
  def index
    @playitems = Playitem.all

    render json: @playitems
  end

  # GET /playitems/1
  def show
    render json: @playitem
  end

  # POST /playitems
  def create
    @playitem = Playitem.new(playitem_params)

    if @playitem.save
      render json: @playitem, status: :created, location: @playitem
    else
      render json: @playitem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playitems/1
  def update
    if @playitem.update(playitem_params)
      render json: @playitem
    else
      render json: @playitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playitems/1
  def destroy
    @playitem.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playitem
      @playitem = Playitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def playitem_params

      params.require(:playitem).permit(:order, :cmd, :value, :page_id)

    end
end


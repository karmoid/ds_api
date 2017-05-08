

class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :update, :destroy]

  # GET /devices
  def index
    @devices = Device.all

    render json: @devices
  end

  # GET /devices/1
  def show
    render json: @device
  end

  # POST /devices
  def create
    params = device_params
    @device = Device.find_by_uuid(params[:uuid])
    if @device.nil?
      @device = Device.new(device_params)
      @device.place_id=Place.find_by_name("default").id
      @device.playlist_id=Playlist.find_by_name("default").id
    else
      @device.name=params[:name]
      @device.ip=params[:ip]
    end

    if @device.save
      render json: @device, status: :created, location: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /devices/1
  def update
    if @device.update(device_params)
      render json: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # DELETE /devices/1
  def destroy
    @device.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_params

      params.require(:device).permit(:name, :uuid, :ip)

    end
end

class Api::V1::SectorsController < Api::V1::ApplicationController
  before_action :set_sector, only: [:show, :update, :destroy]

  def index
    sectors = Api::V1::Sector.page(params[:page]).per(params[:limit])

    render({
      json: sectors,
      root: :sectors,
      each_serializer: Api::V1::SectorSerializer,
      meta: meta_attributes(sectors),
      meta_key: "metadata"
    })
  end

  def create
    sector = Api::V1::Sector.new(sector_params)

    if sector.save
      render json: sector, root: :sector
    else
      render json: { errors: sector.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @sector, root: :sector
  end

  def destroy
    @sector.destroy
  end

  def update
    if @sector.update(sector_params)
      render json: @sector, root: :clinic, status: :ok, location: @sector
    else
      render json: { errors: @sector.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_sector
    @sector = Api::V1::Sector.find(params[:id])
  end

  def sector_params

    params.require(:sector).permit(:id, :name)
  end
end

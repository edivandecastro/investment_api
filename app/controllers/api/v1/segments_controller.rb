class Api::V1::SegmentsController < Api::V1::ApplicationController
  before_action :set_segment, only: [:show, :update, :destroy]

  def index
    segments = Api::V1::Segment.page(params[:page]).per(params[:limit])

    render({
      json: segments,
      root: :segments,
      each_serializer: Api::V1::SegmentSerializer,
      meta: meta_attributes(segments),
      meta_key: "metadata"
    })
  end

  def create
    segment = Api::V1::Segment.new(segment_params)

    if segment.save
      render json: segment, root: :segment
    else
      render json: { errors: segment.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @segment, root: :segment
  end

  def destroy
    @segment.destroy
  end

  def update
    if @segment.update(segment_params)
      render json: @segment, root: :clinic, status: :ok, location: @segment
    else
      render json: { errors: @segment.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_segment
    @segment = Api::V1::Segment.find(params[:id])
  end

  def segment_params

    params.require(:segment).permit(:id, :name)
  end
end

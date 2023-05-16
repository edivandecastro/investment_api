class Api::V1::CountriesController < Api::V1::ApplicationController
  def index
    countries = Api::V1::Country.page(params[:page]).per(params[:limit])

    render({
      json: countries,
      root: :countries,
      each_serializer: Api::V1::CountrySerializer,
      meta: meta_attributes(countries),
      meta_key: 'extra'
    })
  end

  def create
    country = Api::V1::Country.new(country_params)
    country.save
    render json: country, root: :country
  end

  private

  def country_params
    params.require(:country).permit(:id, :name, :locale, :acronym,)
  end
end

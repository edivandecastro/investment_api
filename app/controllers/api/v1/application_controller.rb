class Api::V1::ApplicationController < ApplicationController

  before_action :validate_access_token

  private

  def validate_access_token
    TokenValidation.call(authorization: request.headers['Authorization'])
  rescue ServiceActor::Failure => error
    render json: { success: false, errors: [error.message] }, status: :unauthorized
  end

  def user_id_in_token
    token = request.headers['Authorization'].gsub('Bearer ', '')
    payload = Api::V1::Auth::Jwt.new(token:).decode.first
    payload["sub"]
  end

  def meta_attributes(collection, extra_meta = {})
    {
      pagination: {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.first&.class&.count || 0
      }
    }.merge(extra_meta)
  end
end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'investment-api-3vvw.onrender.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

Rails.application.config.hosts << 'investment-api-3vvw.onrender.com'

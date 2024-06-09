source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

group :framework, :default do
  gem "bootsnap", require: false
  gem "puma", "~> 5.0"
  gem "rails", "~> 7.1.3.2"
end

group :db, :default do
  gem "pg", "~> 1.1"
  gem "seedbank", "~> 0.5.0"
end

group :documentation, :default do
  gem "rswag"
  gem "rswag-api"
  gem "rswag-ui"
end

group :api_builder, :default do
  gem "rack-cors"
  gem "active_model_serializers", "~> 0.10.13"
end

group :pagination, :default do
  gem "kaminari"
end

group :report, :default do
  gem "roo", "~> 2.10.0"
end

group :authentication, :default do
  gem "devise", "~> 4.2"
  gem "devise-i18n"
  gem "jwt"
end

group :business_logic, :default do
  gem "service_actor", "~> 3.7"
end

group :others, :default do
  gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry-byebug"
  gem "rspec-rails", "~> 5.1", ">= 5.1.2"
  gem "shoulda-matchers", "~> 5.3"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.1", ">= 3.1.1"
end

group :development do
  gem "rubocop", "~> 1.56", ">= 1.56.2"
  gem "rubocop-factory_bot", "~> 2.23", ">= 2.23.1"
  gem "rubocop-rails", "~> 2.20", ">= 2.20.2"
  gem "rubocop-rspec", "~> 2.23", ">= 2.23.2"
  gem "rubocop-performance", "~> 1.19"
end

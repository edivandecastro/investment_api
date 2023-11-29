source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem "active_model_serializers", "~> 0.10.13"
gem "kaminari"
gem "seedbank", "~> 0.5.0"
gem "roo", "~> 2.10.0"
gem "service_actor", "~> 3.7"
gem "devise"
gem "devise-i18n"
gem "jwt"

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

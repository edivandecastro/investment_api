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

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry-byebug"
  gem "rspec-rails", "~> 5.1", ">= 5.1.2"
  gem "shoulda-matchers", "~> 5.3"
end

group :development do
end

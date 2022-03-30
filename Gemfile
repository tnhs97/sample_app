source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.3"

gem "bcrypt"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", ">= 3.4.1"
gem "bootstrap-will_paginate"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker"
gem "figaro"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "mini_magick"
gem "puma", "~> 4.3"
gem "rails", "~> 5.2.3"
gem "rails-controller-testing"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "sqlite3"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :production do
  gem "fog", "1.42"
  gem "pg",  "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.7.2'

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bcrypt', '~> 3.1.7'

gem 'factory_bot_rails'
gem 'faker'
gem 'rubocop-rails', require: false
gem 'mini_racer', '~> 0.4.0', platform: :ruby

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov'
  gem 'capybara'
  gem 'pry'
  gem 'launchy'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3.6'
gem 'simple_form'

gem 'devise'     # 회원가입 및 인증
gem 'omniauth'
gem 'omniauth-google-oauth2'

#권한설정
gem 'rolify'
gem 'authority'

# admin
gem 'rails_admin'

# 개발 모드에서 이메일을 보내않고 브라우저에서 미리보기한는 젬
gem 'letter_opener', group: :development

# 페이징
gem 'kaminari'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
#
# version issue로 인한 version 명시 gem
gem 'nio4r', '2.3.1'
gem 'net-ssh', '4.2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'             # rails 지원하는 rspec
  gem 'factory_bot_rails'       # 테스트 위한 DB의 데이타를 쉽게 생성
  gem 'faker'                   # 샘플 테스트 데이터를 쉽게 생성
end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'haml-lint', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# xlsx 다운
gem 'rubyzip'
gem 'axlsx'
gem 'axlsx_rails'

gem 'capistrano', '~> 3.7'
gem 'capistrano-rails', '~> 1.1.0'
gem 'capistrano-rbenv'
gem 'capistrano-bundler'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-nginx'

gem 'jquery-ui-rails'
gem 'figaro'
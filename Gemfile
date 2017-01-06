source 'https://rubygems.org'
# herokuにデプロイ時のWARNING解消の為
# ruby '2.2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use bootstrap
gem 'bootstrap-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails','5.0.5'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# これがないと初回のロード時だけjqueryの処理実行しない
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
#サイトにアニメーションをつける
gem "animate-rails"
gem 'wow-rails'
gem 'owlcarousel-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

# Use for internationalization language.
gem 'rails-i18n'

# javascriptのi18n対応
gem "i18n-js"

# for create test members.
gem 'faker',                '1.6.5'

# for pagination
gem 'kaminari'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# User_registration
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'devise-i18n'

# Use rspec for test.
#gem 'rspec-rails'

# フォームに動的に行の追加と削除するために追加
gem 'cocoon'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '9.0.5'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'   # 開発環境で利用
  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
end

# group :test do
#   gem 'capybara'
# end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'pg'  # 本番(heroku)ではpostgresqlを使用する
  gem 'rails_12factor'  # herokuでデプロイする際のwarring解消
end

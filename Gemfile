source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


ruby '2.2.6'
gem 'rails',                      '~> 5.1.4 '
gem 'pg',                         '~> 0.21.0'                                                             # Use postgres as the database for Active Record

gem 'puma',                       '~> 3.10'                                                               # Use Puma as the app server

gem 'sass-rails',                 '~> 5.0', '>= 5.0.6'                                                    # Use SCSS for stylesheets

gem 'haml',                       '~> 5.0', '>= 5.0.4'                                                    # Haml


gem 'bootstrap',                  '4.0.0.alpha6'                                                       # bootstrap

gem 'uglifier',                   '~> 3.2'                                                                # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails',               '~> 4.2', '>= 4.2.2'                                                    # Use CoffeeScript for .coffee assets and views

gem 'annotate',                   '~> 2.7', '>= 2.7.2'

gem 'jquery-rails',               '~> 4.3', '>= 4.3.1'                                                    # Use jquery as the JavaScript library

gem 'turbolinks',                 '~> 5'                                                                  # Turbolinks, faster navigation
gem 'jbuilder',                   '~> 2.7'                                                                # Build JSON APIs with ease.


gem 'bcrypt',                     '~> 3.1.11'                                                             #password encryption
gem 'devise',                     '~> 4.3'                                                                # User Authentication

#gem 'momentjs-rails',             '>= 2.9.0'                                                              #date_time_picker
#gem 'bootstrap3-datetimepicker-rails', '~> 4.17.43'

gem 'font-awesome-rails',         '~> 4.7.0.2'                                                            #svg icons

gem 'validates_timeliness',       '~> 4.0', '>= 4.0.2'                                                    #date_time validations

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'


group :production, :staging do
  gem 'wkhtmltopdf-heroku',         '~> 2.12', '>= 2.12.4.0'                                              #wkhtmltopdf binaries for heroku
end
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails',              '~> 3.7', '>= 3.7.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :test do
  gem 'capybara', '2.7.1'
end

group :development do

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console',                '>= 3.5.1'
  gem 'listen',                     '~> 3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring',                     '~> 2.0', '>= 2.0.1'
  gem 'spring-watcher-listen',      '~> 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

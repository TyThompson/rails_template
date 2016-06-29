# Usage
# $ rails new blog -m ~/template.rb
# $ rails new blog -m http://example.com/template.rb

# generate(:scaffold, "person name:string")
# route "root to: 'people#index'"
# rake("db:migrate")

# Install Devise
gem "devise"
generate "devise:install"
generate "devise", "User"
environment 'config.action_mailer.default_url_options = {host: "localhost", port: 3000}', env: 'development'

# Pundit
gem "pundit"
generate "pundit:install"

# Bootstrap
gem "twitter-bootstrap-rails"
gem "bootstrap_form"
generate "bootstrap:install", "static"
generate "bootstrap:layout" # auto overwrite

# Other gems
%w( quiet_assets pg ).each { |name| gem name }

if yes?("Do you want HTTParty?")
  gem "httparty"
end

gem_group :development, :test do
  %w( pry-rails better_errors binding_of_caller ).each do |name|
    gem name
  end
end

# Set up database
rake "db:create"
rake "db:migrate"

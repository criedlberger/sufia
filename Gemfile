source 'https://rubygems.org'

# Please see sufia.gemspec for dependency information.
gemspec

# Required for doing pagination inside an engine. See https://github.com/amatsuda/kaminari/pull/322
gem 'kaminari', github: 'harai/kaminari', branch: 'route_prefix_prototype'
gem 'sufia-models', path: './sufia-models'
gem 'sass-rails', '~> 4.0.3'

group :development, :test do
  gem "simplecov", require: false
  gem 'byebug' unless ENV['CI']
end

file = File.expand_path("Gemfile", ENV['ENGINE_CART_DESTINATION'] || ENV['RAILS_ROOT'] || File.expand_path("../spec/internal", __FILE__))
if File.exists?(file)
  puts "Loading #{file} ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(file)
end

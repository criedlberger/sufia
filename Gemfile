source 'https://rubygems.org'

# Please see sufia.gemspec for dependency information.
gemspec

gem 'sufia-models', path: './sufia-models'

# Required for doing pagination inside an engine. See https://github.com/amatsuda/kaminari/pull/322
gem 'kaminari', github: 'harai/kaminari', branch: 'route_prefix_prototype'
gem 'mailboxer', github: 'seankay/mailboxer', branch: 'rails-4-2'
gem 'hydra-editor', path: '../hydra-editor'
gem 'browse-everything', path: '../browse-everything'
gem 'sass-rails', '~> 4.0'
gem 'rails', '4.2.0.rc1'

group :development, :test do
  gem "simplecov", require: false
  gem "byebug", require: false
end # (leave this comment here to catch a stray line inserted by blacklight!)

file = File.expand_path("Gemfile", ENV['ENGINE_CART_DESTINATION'] || ENV['RAILS_ROOT'] || File.expand_path("../spec/internal", __FILE__))
if File.exists?(file)
  puts "Loading #{file} ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(file)
end

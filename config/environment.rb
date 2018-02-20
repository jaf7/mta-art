ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV['SINATRA_ENV'])

require "sinatra/activerecord"
require "rest-client"
require "json"

require_all "app"

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

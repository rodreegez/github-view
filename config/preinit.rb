require 'yaml'

require File.expand_path('../env_loader.rb', __FILE__)

ENVLoader.load(ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development")

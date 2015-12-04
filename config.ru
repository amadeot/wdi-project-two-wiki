require "sinatra"
require "pry"
require "redcarpet"
require_relative "db/config"
require_relative "server"

run App::Server
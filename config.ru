require "sinatra"
require "pry"
require_relative "db/config"
require_relative "server"

run App::Server
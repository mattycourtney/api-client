require 'logger'
require 'httparty'

class SinatraApp
  include HTTParty
  logger ::Logger.new(STDOUT)
  base_uri 'sinatra-app:4567'
end

logger = Logger.new(STDOUT)

loop do
  fortune = `/usr/games/fortune fortunes literature`
  SinatraApp.post('/post', {body: {msg: fortune}})
  logger.info "Sleeping for 3 seconds..."
  sleep 3
end
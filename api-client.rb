require 'logger'
require 'httparty'

class SinatraApp
  include HTTParty
  logger ::Logger.new(STDOUT), :info, :logstash
  base_uri 'sinatra-app:4567'
end

logger = Logger.new(STDOUT)

regular_personas = %w(bighead richard erlich gilfoyle dinesh jared)
special_personas = %w(russ monica gavin jian-yang laurie)

loop do
  # Select a random persona, grabbing one from the 'special' personas if the loop executes within the first 10 seconds of a minute
  persona = Time.now.sec >= 10 ? regular_personas.rotate!.first : special_personas.rotate!.first 
  fortune = `/usr/games/fortune -s fortunes`
  SinatraApp.post('/post', {body: {message: fortune, persona: persona}})
  seconds = rand(3..10)
  logger.info "Sleeping for #{seconds} seconds..."
  sleep seconds
end

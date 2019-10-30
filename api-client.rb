require 'logger'
require 'httparty'

class SinatraApp
  include HTTParty
  logger ::Logger.new(STDOUT), :info, :logstash
  base_uri 'sinatra-app:4567'
end

logger = Logger.new(STDOUT)

regular_personas = %w(richard erlich bighead gilfoyle dinesh)
special_personas = %w(monica jared gavin jian-yang laurie russ)

loop do
  # Select a random persona, grabbing one from the 'special' personas if the loop executes within the first 10 seconds of a minute
  persona = Time.now.sec >= 10 ? regular_personas.sample : special_personas.sample 
  fortune = `/usr/games/fortune fortunes literature`
  SinatraApp.post('/post', {body: {message: fortune, persona: persona}})
  seconds = rand(1..10)
  logger.info "Sleeping for #{seconds} seconds..."
  sleep seconds
end
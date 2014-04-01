class Event < ActiveRecord::Base
attr_accessor :event_names, :parsed_response, :response

require 'rest_client'

EVENT_SELECTION = rand(0..55)

def initialize
  response = RestClient.get 'http://www.kimonolabs.com/api/bo0xm0eg?apikey=605ac5df894ed1e51bc760ce3f0daa17'

@parsed_response = JSON.parse(response)['results']['collection1']
end



  def event_names
     @parsed_response.map {|thing| thing["event_name"]}[EVENT_SELECTION]
  end

  def description
    @parsed_response.map {|thing| thing["description"]}[EVENT_SELECTION]
  end

  def url
    @parsed_response.map {|thing| thing["website"]["href"]}[EVENT_SELECTION]
  end
end
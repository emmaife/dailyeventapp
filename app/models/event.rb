class Event < ActiveRecord::Base
attr_accessor :event_names, :parsed_response, :response

require 'rest_client'
def initialize
  response = RestClient.get 'http://www.kimonolabs.com/api/bo0xm0eg?apikey=605ac5df894ed1e51bc760ce3f0daa17'

@parsed_response = JSON.parse(response)
end

  def event_names
     @parsed_response['results']['collection1'].map {|thing| thing["event_name"]}
  end




end
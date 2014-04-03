class Event < ActiveRecord::Base
attr_accessor :event_names, :parsed_response, :response, :user_neighborhoods, :user_categories

require 'rest_client'



  def initialize(user_neighborhoods, user_categories)
    @user_neighborhoods = user_neighborhoods
    @user_categories = user_categories
    @event_selection = 0
    @user_selection = 0

    response = RestClient.get 'http://www.kimonolabs.com/api/bo0xm0eg?apikey=605ac5df894ed1e51bc760ce3f0daa17'
    @parsed_response = JSON.parse(response)['results']['collection1'].delete_if{ |i| i["description"] == "" || i["description"].length < 50 || i["description"].is_a?(Hash)}
    @user_choice = @parsed_response.select {|i| i["neighborhood"] == user_neighborhoods.pluck(:name)[@user_selection]}
    while @user_choice.empty?
            @user_selection += 1
            if @user_selection <= user_neighborhoods.count
            @user_choice = @parsed_response.select { |i| i["neighborhood"] == user_neighborhoods.pluck(:name)[@user_selection]}
          elsif @user_selection > user_neighborhoods.count
            @user_choice = @parsed_response.select { |i| i["neighborhood"] == "Midtown West"}
          end
        end
      end

  def event_name
     @user_choice.map {|thing| thing["event_name"]}[@event_selection]
  end

  def description
    @user_choice.map {|thing| thing["description"]}[@event_selection]
  end

  def url
    @user_choice.map {|thing| thing["website"]["href"]}[@event_selection]
  end

  def pic
    @user_choice.map {|thing| thing["pic"]["src"]}[@event_selection]
  end

  def neighborhood
    @user_choice.map {|thing| thing["neighborhood"]}[@event_selection]
  end


end




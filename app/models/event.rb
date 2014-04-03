class Event < ActiveRecord::Base
attr_accessor :event_names, :parsed_response, :response, :user_neighborhoods, :user_categories

require 'rest_client'



  def initialize(user_neighborhoods, user_categories)
    @user_neighborhoods = user_neighborhoods
    @user_categories = user_categories
    @event_selection = 0
    @hood_select = 0
    @category_select = rand(0..user_categories.count)

    response = RestClient.get 'http://www.kimonolabs.com/api/bo0xm0eg?apikey=605ac5df894ed1e51bc760ce3f0daa17'
    @parsed_response = JSON.parse(response)['results']['collection1'].delete_if{ |i| i["description"] == "" || i["description"].length < 50 || i["description"].is_a?(Hash)}
    
    @category_results = []
    user_categories.pluck(:name).each do |cat|
       @category_results << @parsed_response.select { |i| i["category"] == cat}
    end

    @result = []
    user_neighborhoods.pluck(:name).each do |hood|
       @result << @category_results.flatten.select { |i| i["neighborhood"] == hood}
    end
    @result.flatten!

    while @result.empty?
      @hood_select += 1
      if @hood_select <= user_neighborhoods.count
        @result = @parsed_response.select { |i| i["neighborhood"] == user_neighborhoods.pluck(:name)[@hood_select]} #&& i["category"] == user_categories.pluck(:name)[@category_select]}
      elsif @hood_select > user_neighborhoods.count
            @result = @parsed_response.select { |i| i["neighborhood"] == "Midtown West"}
          end
        end
      end

  def event_name
     @result.map {|thing| thing["event_name"]}[@event_selection]
  end

  def description
    @result.map {|thing| thing["description"]}[@event_selection]
  end

  def url
    @result.map {|thing| thing["website"]["href"]}[@event_selection]
  end

  def pic
    @result.map {|thing| thing["pic"]["src"]}[@event_selection]
  end

  def neighborhood
    @result.map {|thing| thing["neighborhood"]}[@event_selection]
  end

  def category
    @result.map {|i| i["category"]}[@event_selection]
  end


end




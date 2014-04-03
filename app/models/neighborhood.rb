class Neighborhood < ActiveRecord::Base
  has_many :user_neighborhoods, dependent: :destroy
  has_many :users, :through => :user_neighborhoods
end

class User < ActiveRecord::Base
  has_many :messages
  has_many :game_users, :class_name => "GameUser"
  has_many :games, :through => :game_users

end

class User < ActiveRecord::Base
  attr_accessible :email, :name, :nick_name, :password
  has_many :players
  has_many :t_sessions, through: :players
end

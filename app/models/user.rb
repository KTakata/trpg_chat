class User < ActiveRecord::Base
  attr_accessible :email, :name, :nick_name, :password
  #has_secure_password
end

class User < ActiveRecord::Base
  attr_accessible :email, :name, :nick_name, :password
  has_many :players
  has_many :t_sessions, through: :players

  validates :name, presence: true
  validates :nick_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, presence: true, length: { minimum: 4, maximum: 20}

end

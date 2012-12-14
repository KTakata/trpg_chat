class TSession < ActiveRecord::Base
  attr_accessible :end_flag, :start_flag, :system
  has_many :players
  has_many :users, through: :players
end

class Character < ActiveRecord::Base
  attr_accessible :name, :player_id, :type
  belongs_to :player
end

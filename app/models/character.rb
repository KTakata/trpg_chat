class Character < ActiveRecord::Base
  attr_accessible :name, :player_id, :chara_type
  belongs_to :player
end

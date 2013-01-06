class Character < ActiveRecord::Base
  attr_accessible :name, :player_id, :chara_type, :character_sheet
  has_attached_file :character_sheet
  belongs_to :player
end

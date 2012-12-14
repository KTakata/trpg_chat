class NonPlayerCharacter < ActiveRecord::Base
  attr_accessible :name, :t_session_id, :type
end

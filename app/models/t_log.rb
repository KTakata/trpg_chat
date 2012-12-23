class TLog < ActiveRecord::Base
  attr_accessible :body, :owner_id, :t_session_id
  belongs_to :user, foreign_key: 'owner_id'

end

class TLog < ActiveRecord::Base
  attr_accessible :body, :owner_id, :t_session_id, :log_type, :many, :d_type, :score, :move_side, :move_vertical
  belongs_to :user, foreign_key: 'owner_id'
  validates :body, presence: true
 
end

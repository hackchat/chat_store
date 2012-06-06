class Message < ActiveRecord::Base
  attr_accessible :content, :room_id
  after_create :broadcast_self
  belongs_to :room
end

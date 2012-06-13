class Message < ActiveRecord::Base
  attr_accessible :content, :room_id
  belongs_to :room
end

class Message < ApplicationRecord
  	# associations
	belongs_to :chatroom
	belongs_to :user
end

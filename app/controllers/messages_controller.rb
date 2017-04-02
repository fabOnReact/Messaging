class MessagesController < ApplicationController
	require 'net/http'
  	require 'uri'

	before_action :authenticate_user!
	before_action :set_chatroom

	def create
		message = @chatroom.messages.new(message_params)
		message.body = translator(message.body)
		#binding.pry
		message.user = current_user
		message.save
		MessageRelayJob.perform_later(message)
	end

	private

	def set_chatroom
		@chatroom = Chatroom.find(params[:chatroom_id])
	end

	def message_params
		params.require(:message).permit(:body)
	end

	# code to retrieve the translated text for the translator API
	def translator(input)
		string = "http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&url=http%3A%2F%2Fwww.multivax.com%2Flast_question.html&w=" + input.gsub(" ", "+")
	    uri = URI(string)
	    #http = Net:HTTP.get(uri)
	    res = Net::HTTP.get_response(uri)
	    return string = ((res.body.split('<p>'))[1].split('</p>'))[0]	
	end	
end

class Translator < ApplicationRecord
	require 'net/http'
  	require 'uri'
	# code to retrieve the translated text for the translator API
    uri = URI("http://www.degraeve.com/cgi-bin/babel.cgi?d=haxor&url=http%3A%2F%2Fwww.multivax.com%2Flast_question.html&w=this+is+a+test")
    #http = Net:HTTP.get(uri)
    res = Net::HTTP.get_response(uri)
    string = ((res.body.split('<p>'))[1].split('</p>'))[0]
end
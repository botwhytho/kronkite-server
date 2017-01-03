
require 'net/http'
require 'sinatra'
require 'sinatra/json'
require './lib/server_utils'


set :bind, '0.0.0.0'

get '/' do 
	json :foo => 'bar'
end

get '/trends' do 

	ServerUtils::get_country_id(params[:countries])

	# url = URI.parse("http://www.google.com/trends/hottrends/atom/feed?pn=#{ServerUtils::get_country_id(params[:countries])}")
	# 
	url = URI.parse("http://www.google.com/trends/hottrends/atom/feed?pn=p9")

	content_type 'text/xml'
	response = Net::HTTP.get_response(url)
	response.body
end

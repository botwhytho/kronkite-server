
require "sinatra"
require "sinatra/json"
require "./lib/feed_service"

set :bind, "0.0.0.0"

get "/" do 
  json :foo => "bar"

end

get "/trends" do 
  content_type "text/xml"
  FeedService.get_feeds(params[:countries])

end



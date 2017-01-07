
require "sinatra"
require "sinatra/json"
require "./lib/feed_service"
require "./lib/video_service"

set :bind, "0.0.0.0"

get "/" do 
  json :foo => "bar"
end

get "/trends" do 
  content_type("application/json")
  json(FeedService.get_feeds(params[:countries]))
end

get "/videos" do 
  content_type("application/json")
  VideoService.get_videos
end

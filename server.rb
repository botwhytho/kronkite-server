
require "pp"
require "sinatra"
require "sinatra/json"

require "dotenv/load"
require"./lib/server_utils"
require "./lib/feed_service"
require "./lib/video_service"
require "./lib/music_service"

set :bind, "0.0.0.0"

before do
  origin = request.env["HTTP_ORIGIN"]
  response["Access-Control-Allow-Origin"] = ServerUtils.validate_origin(origin)
end

options "*" do
	headers "Access-Control-Allow-Headers" => "Content-Type",
    		"Access-Control-Allow-Methods" => "POST"
end

get "/" do 
  json :foo => "bar"
end

get "/trending-search" do
  content_type("application/json")
  FeedService.fetch_feed()
end

get "/videos" do 
  content_type("application/json")
  VideoService.get_videos
end

get "/music" do 
  content_type("application/json")
  json(MusicService.get_tracks)
end

get "/article" do 
  content_type("application/json")
  FeedService.fetch_feed_article(params["url"])
end

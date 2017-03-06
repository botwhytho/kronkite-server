module VideoService
  require "net/http"
  require "./lib/auth_service"
  require "pp"

  BASE_URL = "https://www.googleapis.com/youtube/v3/videos?part=snippet%2Cstatistics&chart=mostPopular&maxResults=10&key="

  def self.set_URL(key)
    BASE_URL + "#{key}"
  end

  def self.get_videos
    api_key = AuthService.get_auth("youtubeAPIKey")
    response = Net::HTTP.get_response(URI.parse(set_URL(api_key)))

    sorted_videos = JSON.parse(response.body)["items"].sort { |a, b| 
       b["statistics"]["viewCount"].to_i <=> a["statistics"]["viewCount"].to_i 
    }

    JSON.generate(sorted_videos);
  end

end

module FeedService
  require "./lib/auth_service"
  require "net/http"
  require "crack/xml"
  require "json"
  require "pp"

  API_URL = AuthService.get_auth("googleTrendsAPIURL")
     
  def self.fetch_feed()
    Net::HTTP.get_response(URI.parse(API_URL)).body
  end

end

module FeedService
  require "./lib/auth_service"
  require "net/http"
  require "open-uri"
  require "json"
  require "pp"

  API_URL = AuthService.get_auth("googleTrendsAPIURL")
  MERCURY_API_KEY = AuthService.get_auth("mercuryAPI")["APIKey"]
  MERCURY_API_URL = AuthService.get_auth("mercuryAPI")["URL"]
     
  def self.fetch_feed()
    Net::HTTP.get_response(URI.parse(API_URL)).body
  end

  def self.fetch_feed_article(params)
  	headers = {"x-api-key" => MERCURY_API_KEY }

  	request = open("#{MERCURY_API_URL}#{params}",
  		{"x-api-key" => MERCURY_API_KEY })

 	request.read
  end

end

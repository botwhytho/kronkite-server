module FeedService
  require "net/http"
  require "open-uri"
  require "json"
  require "pp"
     
  def self.fetch_feed()
    Net::HTTP.get_response(URI.parse(ENV["GOOGLE_TRENDS_MS_URL"])).body
  end

  def self.fetch_feed_article(params)
    request = open("#{ENV["MERCURY_API_URL"]}#{params}",
    		{"x-api-key" => ENV["MERCURY_API_KEY"]})
    request.read
  end

end

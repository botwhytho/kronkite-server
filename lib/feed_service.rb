module FeedService
	require 'net/http'
	require 'crack/xml'
	require 'json'
	require 'pp'
	
	#Google Hot Trends XML Feed
	BASE_URL = "http://www.google.com/trends/hottrends/atom/feed?pn="
	@feed_data = []

	def self.set_URL(cid)
		BASE_URL + "#{cid}"

	end

	def self.fetch_feed(cid)
		response = Net::HTTP.get_response(URI.parse(set_URL(cid)))
		@feed_data.push(feed_parser(response.body))
		
	end

	def self.get_country_id(country)
		country_id_table = { 
      us: "p1",
			uk: "p9",
			ca: "p13",
			fr: "p16",
			de: "p15",
			jp: "p4",
			mx: "p21", 
    }

		country_id_table[country.to_sym]

	end

	def self.get_feeds(country_list)
		country_list.split(",").map do |country|
			fetch_feed(get_country_id(country))
		
		end
		@feed_data

  end

  def self.feed_parser(xml_feed)
  	Crack::XML.parse(xml_feed)

  end

end

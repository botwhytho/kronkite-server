module ServerUtils

	def self.get_country_id(countryList)
		puts countryList.split(",")

		#return array with Google Trends country ids from the countryList
		countryTable = { "United States" => "p1",
										"United Kingdom" => "p9",
										"Canada" => "p13",
										"France" => "p16",
										"Germany" => "p15",
										"Japan" => "p4",
										"Mexico" => "p21" }

		puts countryTable[countryList]
	end

end

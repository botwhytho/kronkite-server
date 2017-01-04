module ServerUtils

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

		puts country_id_table[country.to_sym]
	end

end

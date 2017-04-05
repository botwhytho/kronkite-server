module ServerUtils

  def self.validate_origin(origin)
    mode = ENV["RACK_ENV"] || "development"
    origin_map = {
      development: ["http://localhost:8888", "http://192.168.254.4:8888", "http://10.0.20.16:8888"],
      production: ["http://supsean.com"]
    }
    
    if 
    	origin_map[mode.to_sym].include?(origin)
    then
    	origin
    end
  end

end
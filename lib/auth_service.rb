module AuthService
  require "json"

  def self.get_auth(key)
    auth_map = JSON.parse(File.read("./config/auth.json"))
    auth_map[key]
  end

end

module AppConfig
  require "json"

  def self.get_config_var(variable)
    config_vars = JSON.parse(File.read("./config/config.json"))
    config_vars[variable]
  end

end

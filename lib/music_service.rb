module MusicService
  require "net/http"
  require "base64"
  require "./lib/auth_service"

  @spotify_api_credentials = AuthService.get_auth("spotifyAPI")

  def self.get_tracks()
    encode(@spotify_api_credentials)
  end

  def self.encode(creds)
    coded_creds = {}
       creds.each do |cred, value|
        coded_creds[cred] = Base64.encode64(value)
       end
    coded_creds
  end



end

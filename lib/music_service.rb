module MusicService
  require "net/http"
  require "base64"
  require "rspotify"
  require "pp"
  require "./lib/auth_service"

  #@API_creds = AuthService.get_auth("spotifyAPI")
  CLIENT_ID = ENV["SPOTIFY_API_CLIENTID"]
  CLIENT_SECRET = ENV["SPOTIFY_API_CLIENT_SECRET"]

  def self.get_tracks()
    RSpotify.authenticate(CLIENT_ID, CLIENT_SECRET)
    category = RSpotify::Category.find("toplists", country: "US")

    pp category.playlists.first.tracks
  end

end

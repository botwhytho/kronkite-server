module MusicService
  require "net/http"
  require "base64"
  require "rspotify"
  require "pp"
  require "./lib/auth_service"

  @API_creds = AuthService.get_auth("spotifyAPI")

  def self.get_tracks()
    RSpotify.authenticate(@API_creds["clientID"], @API_creds["clientSecret"])
    category = RSpotify::Category.find("toplists", country: "US")

    pp category.playlists.first.tracks
  end

end

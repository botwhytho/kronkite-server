module MusicService
  require "net/http"
  require "base64"
  require "rspotify"
  require "pp"

  def self.get_tracks()
    RSpotify.authenticate(ENV["SPOTIFY_API_CLIENTID"], 
      ENV["SPOTIFY_API_CLIENT_SECRET"])
    category = RSpotify::Category.find("toplists", country: "US")

    pp category.playlists.first.tracks
  end

end

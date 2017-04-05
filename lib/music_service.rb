module MusicService
  require "net/http"
  require "base64"
  require "json"
  require "rspotify"
  require "pp"

  def self.get_tracks()


    #tracks = JSON.parse(File.read("./lib/sample-api-data.json"))

    RSpotify.authenticate(ENV["SPOTIFY_API_CLIENTID"], 
      ENV["SPOTIFY_API_CLIENT_SECRET"])
    category = RSpotify::Category.find("toplists", country: "US")
    tracks = category.playlists.first.tracks.first(25)
    parsed_track_data = []

    tracks.each { |track|  
        track_data = {popularity: track.popularity,
                      name: track.name,
                      artists: track.artists.map{|artist| artist.name},
                      album: track.album.name,
                      album_art: track.album.images,
                      release_date: track.album.release_date,
                      preview_url: track.preview_url}
        parsed_track_data.push(track_data)
    }

    parsed_track_data.select! { |track| track[:popularity] > 80 } 
    parsed_track_data.sort_by! { |track| track[:popularity] }
    parsed_track_data.reverse
  end

end

namespace :importer do
  desc "Load artists from YAML file"
  task load_artists: :environment do
    system "clear"
    puts "Cleaning database"
    DatabaseCleaner.clean_with :truncation
    puts "Database cleaned!"

    puts "Fetching artist data..."
    artists_yml = YAML.load_file(Rails.root.join("db", "seeds", "artists.yml"))["artists"]
    bar = TTY::ProgressBar.new("Downloading data for :artist [:bar] :percent \r", total: artists_yml.count)
    artists_yml.each do |artist|
        artist_info = RSpotify::Artist.search(artist.to_s).first
        bar.advance(artist: artist.to_s)
        if artist_info
          artist = create_artist(artist_info)
          create_artist_albums(artist_info.albums, artist)
        else
          system "clear"
          puts "Artist #{artist} not found"
        end
    end
end

def create_artist(artist)
  return Artist.create!(
    name:        artist.name,
    image:       artist.images.first["url"],
    genres:      artist.genres,
    popularity:  artist.popularity,
    spotify_id:  artist.id,
    spotify_url: artist.external_urls["spotify"]
  )
end

def create_album(album, artist)
  return Album.create!(
    name:         album.name,
    image:        album.images.first["url"],
    spotify_url:  album.external_urls["spotify"],
    total_tracks: album.total_tracks,
    spotify_id:   album.id,
    artist:       artist
  )
end

def create_song(song, album)
  Song.create!(
    name:        song.name,
    spotify_url: song.external_urls["spotify"],
    preview_url: song.preview_url,
    duration_ms: song.duration_ms,
    explicit:    song.explicit,
    spotify_id:  song.id,
    album:       album
  )
end

def create_artist_album_songs(tracks, album)
    if tracks.length() > 0
        tracks.each do |song|
            create_song(song, album)
        end
    end
end

def create_artist_albums(albums, artist)
    if albums.length() > 0
        albums.uniq { |album| album.name }.each do |album|
            album_instance = create_album(album, artist)
            create_artist_album_songs(album.tracks, album_instance);
        end
    end
end
end
FactoryBot.define do
  factory :album do
    name { "albumname" }
    image { "imageurl" }
    spotify_url { "spotifyurl" }
    total_tracks { 1 }
    spotify_id { "spotifyid" }
    artist
  end
end

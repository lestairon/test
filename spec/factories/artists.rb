FactoryBot.define do
  factory :artist do
    name { "John Doe" }
    image { "spotifyimageurl" }
    genres { ["Rock", "Dubstep", "Vallenato"] }
    popularity { 45 }
    spotify_url { "spotifyurl" }
    spotify_id { "spotifyid" }
  end
end

FactoryBot.define do
  factory :artist do
    name { "John Doe" }
    image { "spotifyimageurl" }
    popularity { 45 }
    spotify_url { "spotifyurl" }
    spotify_id { "spotifyid" }
    genres { [create(:genre)] }
  end
end

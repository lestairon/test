FactoryBot.define do
  factory :song do
    name { "songname" }
    spotify_url { "spotifyurl" }
    preview_url { "previewurl" }
    duration_ms { 1 }
    explicit { [true, false].sample }
    spotify_id { "spotifyid" }
    album
  end
end

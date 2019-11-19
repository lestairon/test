Artist.create!(
  name: "John Doe", 
  image: "imageurl", 
  genres: ["DnB", "Rock"],
  popularity: 25,
  spotify_url: "spotify_url",
  spotify_id: "spotify_id"
)
Album.create!(
  name: "Jhon Doe's Album",
  image: "imageurl",
  spotify_url: "spotify_url",
  total_tracks: 12,
  spotify_id: "spotify_id",
  artist: Artist.first
)
Song.create!(
  name: "Jhon Doe's Song",
  spotify_url: "spotify_url",
  preview_url: "preview_url",
  duration_ms: 1,
  explicit: false,
  spotify_id: "spotify_id",
  album: Album.first
)
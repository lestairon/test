require "rails_helper"

RSpec.describe Song, type: :model do
  it "should be invalid without attributes" do
    expect(Song.new().valid?).to eq false
  end
  it "should be valid with all the attributes" do
    artist = Artist.new(
      name: "John Doe",
      image: "imageurl",
      genres: [create(:genre)],
      popularity: 25,
      spotify_url: "spotify_url",
      spotify_id: "spotify_id",
    )
    album = Album.new(
      name: "Jhon Doe's Album",
      image: "imageurl",
      spotify_url: "spotify_url",
      total_tracks: 12,
      spotify_id: "spotify_id",
      artist: artist,
    )

    expect(Song.new(
      name: "Jhon Doe's Song",
      spotify_url: "spotify_url",
      preview_url: "preview_url",
      duration_ms: 1,
      explicit: false,
      spotify_id: "spotify_id",
      album: album,
    ).valid?).to eq true
  end
end

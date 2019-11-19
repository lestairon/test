require 'rails_helper'

RSpec.describe Album, type: :model do
  it "should be invalid without attributes" do
    expect(Album.new().valid?).to eq false 
  end
  it "should be valid with all the attributes" do
    artist = Artist.new(name: "John Doe", 
      image: "imageurl", 
      genres: ["DnB", "Rock"],
      popularity: 25,
      spotify_url: "spotify_url",
      spotify_id: "spotify_id")


    expect(Album.new(
      name: "Jhon Doe's Album",
      image: "imageurl",
      spotify_url: "spotify_url",
      total_tracks: 12,
      spotify_id: "spotify_id",
      artist: artist
      ).valid?).to eq true
  end
end

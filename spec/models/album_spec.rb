require "rails_helper"

RSpec.describe Album, type: :model do
  let(:artist) { create :artist }
  it "should be invalid without attributes" do
    expect(Album.new().valid?).to be false
  end
  it "should be valid with all the attributes" do
    expect(Album.new(
      name: "Jhon Doe's Album",
      image: "imageurl",
      spotify_url: "spotify_url",
      total_tracks: 12,
      spotify_id: "spotify_id",
      artist: artist,
    ).valid?).to eq true
  end
end

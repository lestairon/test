require "rails_helper"

RSpec.describe Artist, type: :model do
  it "should be invalid without attributes" do
    expect(Artist.new().valid?).to eq false
  end
  it "should be valid with all the attributes" do
    expect(Artist.new(name: "John Doe",
                      image: "imageurl",
                      genres: [create(:genre)],
                      popularity: 25,
                      spotify_url: "spotify_url",
                      spotify_id: "spotify_id").valid?).to eq true
  end
end

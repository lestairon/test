require "rails_helper"

RSpec.describe Api::V1::SongsController, type: :controller do
  describe "#random_song" do
    before do
      create :song
      get :random_song, params: { genre_name: "Rock" }
    end

    it "responds in json format", :focus do
      expect(response.content_type).to eq "application/json"
    end

    it "follows songs schema" do
      expect(response).to match_response_schema("song")
    end
  end
end

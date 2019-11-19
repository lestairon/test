require 'rails_helper'

RSpec.describe Api::V1::SongsController, type: :controller do
  describe "#random_song" do
    it "responds in json format" do
      get :random_song, params: { genre_name: "rock" }
      expect(response.content_type).to eq "application/json"
    end

    it "follows songs schema" do
      get :random_song, params: { genre_name: "Rock" }
      expect(response).to match_response_schema("song")
    end
  end
end

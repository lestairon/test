require "rails_helper"

RSpec.describe Api::V1::AlbumsController, type: :controller do
  describe "#get_songs" do
    let(:song) { create :song }
    before { get :get_songs, params: { id: song.id } }

    it "responds in json format" do
      expect(response.content_type).to eq "application/json"
    end

    it "follows songs schema" do
      expect(response).to match_response_schema("song")
    end
  end
end

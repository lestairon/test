require "rails_helper"

RSpec.describe Api::V1::ArtistsController, type: :controller do
  describe "#index" do
    before { get :index }

    it "responds in json format" do
      expect(response.content_type).to eq "application/json"
    end

    it "follows artist schema" do
      expect(response).to match_response_schema("artist")
    end
  end

  describe "#get_albums" do
    let(:artist) { create :artist }
    before { get :get_albums, params: { id: artist.id } }

    it "responds in json format" do
      expect(response.content_type).to eq "application/json"
    end

    it "follows albums schema" do
      expect(response).to match_response_schema("album")
    end
  end
end

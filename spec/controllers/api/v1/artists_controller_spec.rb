require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  describe "#index" do
    it "responds in json format" do
      get :index
      expect(response.content_type).to eq "application/json"
    end
    it "follows artist schema" do
      get :index
      expect(response).to match_response_schema("artist")
    end
  end
  describe "#get_albums" do
    it "responds in json format" do
      get :get_albums, params: { id: 1 }
      expect(response.content_type).to eq "application/json"
    end
    it "follows albums schema" do
      get :get_albums, params: { id: 1 }
      expect(response).to match_response_schema("album")
    end
  end
end

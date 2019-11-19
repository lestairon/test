require 'rails_helper'

RSpec.describe Api::V1::AlbumsController, type: :controller do
  describe "#get_songs" do
    it "responds in json format" do
      get :get_songs, params: { id: 1 }
      expect(response.content_type).to eq "application/json"
    end

    it "follows songs schema" do
      get :get_songs, params: { id: 1 }
      expect(response).to match_response_schema("song")
    end
  end
end

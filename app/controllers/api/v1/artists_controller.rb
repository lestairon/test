class Api::V1::ArtistsController < ApplicationController
      def index
        artists = Artist.all.order(popularity: :desc)
        render json: { data: artists}, except: [:spotify_id, :created_at, :updated_at], status: :ok
      end

      def get_albums
        albums = Artist.find(params[:id]).albums
        render json: { data: albums }, except: [:spotify_id, :artist_id, :created_at, :updated_at], status: :ok
      end
end
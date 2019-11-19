class Api::V1::AlbumsController < ApplicationController
  def get_songs
    songs = Album.find(params[:id]).songs
    render json: {data: songs}, except: [:id, :created_at, :updated_at, :spotify_id, :album_id], status: :ok
  end
end

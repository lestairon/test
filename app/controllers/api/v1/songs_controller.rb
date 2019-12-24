class Api::V1::SongsController < ApplicationController
  def random_song
    random_song = Song.joins(album: { artist: :genres }).where(genres: { name: params[:genre_name] }).sample
    if random_song
      render json: { data: random_song }, except: [:id, :created_at, :updated_at, :album_id, :spotify_id], status: :ok
    else
      render json: { error: "Couldn't find a song with that genre, are you sure you typed it correctly?" }, status: :not_found
    end
  end
end

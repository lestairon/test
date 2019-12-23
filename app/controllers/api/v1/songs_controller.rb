class Api::V1::SongsController < ApplicationController
  def random_song
    get_artists = Artist.where("genres LIKE ?", "%#{params[:genre_name]}%")
    unless get_artists.empty?
      album = Album.where(artist: get_artists.sample).sample
      song = Song.where(album: album).sample
      render json: { data: song }, except: [:id, :created_at, :updated_at, :album_id, :spotify_id], status: :ok
    end
  end
end

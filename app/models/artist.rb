class Artist < ApplicationRecord
  validates :spotify_id, :name, :image, :genres, :popularity, :spotify_url, presence: true
  has_many :albums
end

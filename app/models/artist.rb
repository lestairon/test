class Artist < ApplicationRecord
  validates :spotify_id, :name, :image, :genres, :popularity, :spotify_url, presence: true
  has_many :albums
  has_and_belongs_to_many :genres
end

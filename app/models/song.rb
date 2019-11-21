class Song < ApplicationRecord
  validates :name, :spotify_url, :duration_ms, :spotify_id, presence: true
  validates :explicit, inclusion: {in: [true, false]}
  belongs_to :album
end

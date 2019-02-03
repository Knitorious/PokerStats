class Result < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :place, presence: true, numericality: true
  validates :player_id, uniqueness: { scope: :game_id }
end
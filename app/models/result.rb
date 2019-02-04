class Result < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :place, presence: true, numericality: true, uniqueness: { scope: :game_id }
  validates :player_id, uniqueness: { scope: :game_id }
end
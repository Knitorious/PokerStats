class Player < ApplicationRecord
    has_many :results
    has_many :games, through: :results 

    def calculate_stats
        update(
            points: results.sum(:points),
            net_money: results.sum(:winnings) - (20 * results.size),
            top_place: results.minimum(:place),
            wins: results.where(place: 1).size,
            win_percentage: results.where(place: 1).size / results.size.to_f * 100,
            heads_up: results.where(place: [1,2]).size,
            games_played: results.size,
        )
    end
    
end

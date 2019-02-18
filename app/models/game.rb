class Game < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :players, through: :results
    
    def calculate_results
        find_result_by_place(3).update(winnings: third_place_winnings)
        find_result_by_place(2).update(winnings: second_place_winnings)
        find_result_by_place(1).update(winnings: first_place_winnings)
       
        previous_points = nil

        results.order(place: :desc).each_with_index do |result, index|
            if result.place <= money_places
                points = previous_points + 3
            else 
                points = index + 1
            end
            result.update(points: points)
            previous_points = points 
        end
     
        Player.find_each do |player|
            player.calculate_stats
        end
         
    end

    def find_result_by_place(place)
        results.find { |r| r.place == place }
    end

    def first_place_winnings
        (results.size * buy_in) - third_place_winnings - second_place_winnings
    end

    def second_place_winnings
        case results.size
        when 6
            20
        when 7
            40
        when 8..11
            40
        when 12..99
            60
        else
            0
        end
    end

    def third_place_winnings
        case results.size
        when 8..11
            20
        when 12..99
            20
        else
            0
        end
    end
    
end

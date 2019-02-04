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
        
    end

    def find_result_by_place(place)
        results.find { |r| r.place == place }
    end

    def first_place_winnings
        (results.size * buy_in) - third_place_winnings - second_place_winnings
    end

    def second_place_winnings
        40
    end

    def third_place_winnings
        20
    end
    
end

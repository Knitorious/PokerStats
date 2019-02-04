class AddBuyInToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :buy_in, :integer, default: 20
    add_column :games, :money_places, :integer, default: 3
    add_column :games, :base_point_number, :integer, default: 1
  end
end

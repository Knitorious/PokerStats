class AddStatsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :points, :integer, default: 0
    add_column :players, :net_money, :integer, default: 0
    add_column :players, :top_place, :integer, default: 0
    add_column :players, :wins, :integer, default: 0
    add_column :players, :win_percentage, :float, default: 0
    add_column :players, :heads_up, :integer, default: 0
    add_column :players, :games_played, :integer, default: 0
  end
end

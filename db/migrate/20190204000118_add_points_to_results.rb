class AddPointsToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :points, :integer
    add_column :results, :winnings, :integer, default: 0
  end
end

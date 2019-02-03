class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.date :played_at

      t.timestamps
    end
  end
end

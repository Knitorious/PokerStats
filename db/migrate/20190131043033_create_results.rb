class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true
      t.integer :place

      t.timestamps
    end
  end
end

class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :board, foreign_key: true
      t.string :player
      t.decimal :score, precision: 12, scale: 3

      t.timestamps
    end
  end
end

class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.references :board, foreign_key: true
      t.string :name
      t.string :string
      t.integer :top
      t.integer :left

      t.timestamps
    end
  end
end

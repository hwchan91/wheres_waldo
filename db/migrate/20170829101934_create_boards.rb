class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :level
      t.string :url

      t.timestamps
    end
  end
end

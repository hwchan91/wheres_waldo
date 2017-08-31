class RemoveStringFromCharacters < ActiveRecord::Migration[5.1]
  def change
    remove_column :characters, :string, :string
  end
end

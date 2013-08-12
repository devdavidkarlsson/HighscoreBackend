class AddLevelsToGames < ActiveRecord::Migration
  def change
    add_column :levels, :game_id, :integer
    add_index :levels, :game_id
  end
end

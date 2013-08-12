class RenameGameName < ActiveRecord::Migration
  def change
    rename_column :games, :List, :name

  end
end

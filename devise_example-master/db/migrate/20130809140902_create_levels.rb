class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.decimal :score

      t.timestamps
    end
  end
end

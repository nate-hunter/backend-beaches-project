class CreateBeaches < ActiveRecord::Migration[5.2]
  def change
    create_table :beaches do |t|
      t.string :name
      t.string :island
      t.string :location
      t.string :img
      t.boolean :surf, default: false
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end

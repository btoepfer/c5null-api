class CreateBlueprints < ActiveRecord::Migration[5.0]
  def change
    create_table :blueprints do |t|
      t.string :name, null: false, limit:30
      t.string :description, null: true, limit:2000
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :blueprints, :name, :unique => true
  end
end

class CreateAppConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :app_configs do |t|
      t.string :name, null: false, limit:100
      t.text :description, null: true
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :app_configs, :name, :unique => true
  end
end

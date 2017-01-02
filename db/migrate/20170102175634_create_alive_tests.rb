class CreateAliveTests < ActiveRecord::Migration[5.0]
  def change
    create_table :alive_tests do |t|
      t.string :message

      t.timestamps
    end
  end
end

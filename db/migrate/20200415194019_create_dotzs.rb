class CreateDotzs < ActiveRecord::Migration[5.2]
  def change
    create_table :dotzs do |t|
      t.integer :moeda, minimum: 0, default: 0
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end

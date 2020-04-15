class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :valor_da_compra
      t.integer :quantidade

      t.timestamps
    end
  end
end

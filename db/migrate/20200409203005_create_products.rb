class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :nome
      t.bigint :valor_dotz, :limit => 100000
      t.string :imagem
      t.integer :estoque, :minimum => 1

      t.timestamps
    end
  end
end
